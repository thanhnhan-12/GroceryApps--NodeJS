import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');
const uniqid = require('uniqid');

const adminService = {
  getAllUser: async () => {
    const userList = await queryDb(
      `Select userID, userName, fullName, email from tblUser; `
    );

    return userList;
  },

  updateAccountById: async (idAccount, body) => {
    const {  } = body;
  },

};

export default adminService;