import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const cartService = {
  getCartService: async () => {
    const cart = await queryDb(
      `Select Pro.productID, Pro.productName, Pro.price, Pro.expirationDate, Pro.unit, Pro.quantity, Img.imageURL 
      from tblproduct as Pro, tblimages as Img `,
    );

    if (_.isEmpty(cart))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy giỏ hàng');
    return cart;
  },
};

export default cartService;
