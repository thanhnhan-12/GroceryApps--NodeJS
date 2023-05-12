import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const categoryService = {
  getCategoryService: async () => {
    const category = await queryDb('select * from tblcategory');
    // console.log({category});
    if (_.isEmpty(category))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy danh mục');
    return category;
  },
};

export default categoryService;
