import queryDb from "../config/db";
import ApiError from "../utils/ApiError";
import httpStatus from "http-status";

var _ = require("lodash");
var bcrypt = require("bcrypt");

const saltRounds = 10;

const authService = {
  login: async (body, id_role) => {
    const { email, password } = body;
    console.log({body});
    const user = await queryDb("select * from tbluser where email=?",[email]);
    console.log({user})
    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        "Không tìm thấy tài khoản người dùng"
      );
    const match = await bcrypt.compare(
      password,
      String(user[0].passWord).trim()
    );
    if (match) {
      const { password, ...users } = user[0];
      return {
        users,
        message: "Đăng nhập thành công",
      };
    } else {
      throw new ApiError(httpStatus.BAD_REQUEST, "Mật khẩu không đúng");
    }
  },

  register: async (body) => {
    const { email, fullName, password } = body;
    console.log("Body: " + body);
    const user = await queryDb('select * from tbluser where email=?', [
      email,
    ]);
    if (!_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Tài khoản người dùng đã tồn tại'
      );
    const hashPassword = await bcrypt.hash(password, saltRounds);
    console.log({hashPassword});

    const rows = await queryDb(
      'insert into tbluser(email, fullName, passWord) values(?,?,?)',
      [email, fullName, hashPassword]
    );
    if (rows.insertId >= 0) {
      const users = await queryDb('select * from tbluser where email=?', [
        email,
      ]);
      const { password, ...orther } = users[0];
      return {
        users: orther,
      };
    } else {
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        'Tạo tài khoản không thành công'
      );
    }
  },

  

};

export default authService;
