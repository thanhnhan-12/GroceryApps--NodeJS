import queryDb from "../config/db";
import ApiError from "../utils/ApiError";
import httpStatus from "http-status";

var _ = require("lodash");
var bcrypt = require("bcrypt");

const saltRounds = 10;

const authService = {
  login: async (body, id_role) => {
    const { email, password } = body;
    const user = await queryDb("select * from tbluser");
    console.log({user})
    if (_.isEmpty(user))
      throw new ApiError(
        httpStatus.BAD_REQUEST,
        "Không tìm thấy tài khoản người dùng"
      );
    const match = await bcrypt.compare(
      password,
      String(user[0].password).trim()
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
};

export default authService;
