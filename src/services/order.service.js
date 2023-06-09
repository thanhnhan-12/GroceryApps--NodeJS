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
    const orderList = [];

    const userOrderList = await queryDb(
      `Select O.orderID, O.orderStatus, O.totalPrice, O.orderDate, O.deliveryDate, 
      U.fullName, U.phone, UD.userNameAddress
      from tblOrder as O, tblUser as U, tblUserAddress as UD
      where U.userID = O.userID and U.userID = UD.userID and O.userAddressID = UD.userAddressID and orderStatus = ? `,
      [orderStatus],
    );

    for (let i = 1; i < userOrderList.length; i++) {
      const orderDetails = await queryDb(
        `Select Pro.productName, Pro.quantity, Pro.price from tblOrderDetail as OD, tblProduct as Pro where OD.productID = Pro.productID and OD.orderID = ? `,
        [userOrderList[i].orderID],
      );

      orderList.push({ ...userOrderList[i], orderDetails });
      // console.log("Log: ", orderDetail);
    }

    return orderList;
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
