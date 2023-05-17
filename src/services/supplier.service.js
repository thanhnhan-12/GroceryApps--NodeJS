import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const supplierService = {
  getSupplierService: async () => {
    const supplier = await queryDb(`Select suppImage from tblsupplier `);

    if (_.isEmpty(supplier))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Nhà phân phối');

    return supplier;
  }

}

export default supplierService;