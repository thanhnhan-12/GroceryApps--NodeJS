import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const productService = {
  getProductService: async () => {
    const product = await queryDb(
      `Select Pro.productID, productName, price, expirationDate, unit, wh.dateImport, Img.imageURL 
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
      `select pro.productID , pro.productName, price, expirationDate, unit, tblimages.imageURL
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
};

export default productService;
