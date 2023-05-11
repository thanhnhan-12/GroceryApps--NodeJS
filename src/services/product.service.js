import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const productService = {
  getProductService: async (body) => {
    const { productID, productName, price, unit, expirationDate } = body;
    console.log({ body });
    const user = await queryDb('select * from tblproduct where productID=?', [
      productID,
    ]);

    if (_.isEmpty(user))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');


  },



};


export default productService;