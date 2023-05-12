import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const productService = {
  getProductService: async () => {
    const product = await queryDb(
      'select productID, productName, price, expirationDate, unit from tblproduct',
    );
    // console.log({product});
    if (_.isEmpty(product))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return product;
  },
};

export default productService;
