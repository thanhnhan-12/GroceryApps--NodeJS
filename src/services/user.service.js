import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const userService = {
  getUserInfor: async (userID) => {
    const userInfor = await queryDb(
      `Select * from tblUser where userID = ?  `,
      [userID],
    );

    return userInfor;
  },

  updateUserInforById: async (userID, body) => {
    const { userName, passWord, fullName, email, phone, birthday } = body;

    console.log('Update: ', body, userID);

    const userInforById = await queryDb(
      `Update tblUser 
      set userName = ?, passWord = ?, fullName = ?, 
          email = ?, phone = ?, birthday = ? 
      where userID = ?
      `,
      [userName, passWord, fullName, email, phone, birthday, userID],
    );

    return userInforById;
  },
};

export default userService;
