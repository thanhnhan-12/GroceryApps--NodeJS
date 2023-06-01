import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const orderService = {
  getAllOrders: async (userID) => {
    const orderList = await queryDb(
      `Select orderStatus, totalPrice, orderDate, deliveryDate from tblOrder where userID = ? `,
      [userID],
    );

    return orderList;
  },

  getAllUserOrders: async (orderStatus) => {
    const userOrderList = await queryDb(
      `Select orderID,orderStatus, totalPrice, orderDate, deliveryDate from tblOrder where orderStatus = ? `,
      [orderStatus],
    );

    return userOrderList;
  },

  updateListOrderStatus: async (body) => {
    console.log('Body: ', body);

    let updateStatement = '';

    for (let i = 0; i < body.length; i++) {
      const { orderID } = body[i];
      const userOrderStatus = await queryDb(
        `UPDATE tblOrder SET orderStatus = 1, deliveryDate = now() WHERE orderID = ?`,
        [orderID],
      );
    }
  },
};

export default orderService;
