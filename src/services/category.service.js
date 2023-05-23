import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const categoryService = {
  getCategoryService: async () => {
    const category = await queryDb(
      `Select categoryID, categoryName, categoryColor, categoryImage from tblcategory`,
    );
    if (_.isEmpty(category))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy danh mục');
    return category;
  },

  getProductCategoryType: async (categoryID) => {
    const proCategoryType = await queryDb(
      ` SELECT Pro.productID, Pro.productName, Pro.quantity, Pro.unit, Pro.price, Pro.expirationDate, Img.imageURL, C.categoryName
      FROM tblproduct AS Pro
      JOIN tblcategory AS C ON Pro.categoryID = C.categoryID
      JOIN (
          SELECT productID, MAX(imageURL) AS imageURL
          FROM tblimages
          GROUP BY productID
      ) AS Img ON Pro.productID = Img.productID
      WHERE C.categoryID = ?
      GROUP BY Pro.productID; `, [categoryID],
    );

    // if (_.isEmpty(proCategoryType))
    //   throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return proCategoryType;
  },

};

export default categoryService;
