import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');
const uniqid = require('uniqid');

const adminService = {
  getAllUser: async () => {
    const userList = await queryDb(
      `Select userID, userName, fullName, email from tblUser; `,
    );

    return userList;
  },

  getStatistical: async () => {
    const totalAmount = await queryDb(
      `SELECT SUM(totalPrice) AS totalAmount
      FROM tblOrder
      WHERE MONTH(deliveryDate) = MONTH(CURRENT_DATE()) AND YEAR(deliveryDate) = YEAR(CURRENT_DATE());
      `,
    );

    const totalPriceMonth = await queryDb(`
      SELECT MONTH(deliveryDate) AS month, SUM(totalPrice) AS totalAmount
      FROM tblOrder
      WHERE YEAR(deliveryDate) = YEAR(CURRENT_DATE())
      GROUP BY MONTH(deliveryDate);
    `);

    const dataProduct = await queryDb(`
      SELECT p.productID, p.productName, SUM(od.quantity) AS totalSold
      FROM tblOrderDetail od
      JOIN tblProduct p ON od.productID = p.productID
      GROUP BY p.productID, p.productName
      ORDER BY totalSold DESC
      LIMIT 0,5;
    `);

    const userTop = await queryDb(`
    SELECT u.userID, u.fullName, COUNT(*) AS totalOrders
    FROM tblOrder o
    JOIN tblUser u ON o.userID = u.userID
    GROUP BY u.userID, u.fullName
    ORDER BY totalOrders DESC
    LIMIT 5;
    `);

    return {
      totalAmount: totalAmount[0].totalAmount,
      totalPriceMonth,
      dataProduct,
      userTop,
    };
  },

  updateAccountById: async (idAccount, body) => {
    const {} = body;
  },
};

export default adminService;
