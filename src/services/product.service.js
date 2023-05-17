import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const productService = {
  getProductService: async () => {
    const product = await queryDb(
      `Select Pro.productID, productName, price, expirationDate, unit, Pro.quantity, wh.dateImport, Img.imageURL 
       from tblproduct as Pro , tblwarehouse as Wh, tblimages as Img 
       where Wh.wareHouseID = Pro.wareHouseID and Pro.productID = Img.productID Order By dateImport DESC Limit 10 `,
    );
    // console.log({product});

    if (_.isEmpty(product))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return product;
  },

  getProductSellingService: async () => {
    const productSelling = await queryDb(
      `select pro.productID , pro.productName, price, expirationDate, unit, Pro.quantity, tblimages.imageURL
      from tblimages, tblproduct as pro
      left join (select productId, COUNT(Od.quantity) as quantity from tblorderdetail AS Od group by productId) as limitP 
      on limitP.productId = pro.productId
      where tblimages.productId = pro.productID 
      group by pro.productID, pro.productName
       `,
    );

    if (_.isEmpty(productSelling))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return productSelling;
  },

  getProductPopularService: async () => {
    const productPopular = await queryDb(
      `SELECT Pro.productID, productName, price, expirationDate, unit, Pro.quantity, COUNT(Od.quantity) as quantity_sold, Img.imageURL 
      FROM tblproduct AS Pro 
      JOIN tblorderdetail AS Od ON Pro.productID = Od.productID 
      JOIN tblimages AS Img ON Pro.productID = Img.productID 
      GROUP BY Pro.productID 
      ORDER BY quantity_sold DESC 
      LIMIT 10;`,
    );

    if (_.isEmpty(productPopular))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return productPopular;
  },

};

export default productService;
