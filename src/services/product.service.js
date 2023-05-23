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
      where Wh.wareHouseID = Pro.wareHouseID and Pro.productID = Img.productID 
      Group by Pro.productID
      Order By dateImport DESC Limit 10; `,
    );
    // console.log({product});

    if (_.isEmpty(product))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return product;
  },

  getProductSellingService: async () => {
    const productSelling = await queryDb(
      `SELECT pro.productID, pro.productName, price, expirationDate, unit, Pro.quantity, MAX(tblimages.imageURL) AS imageURL
      FROM tblimages, tblproduct AS pro
      LEFT JOIN (SELECT productId, COUNT(Od.quantity) AS quantity
      FROM tblorderdetail AS Od
      GROUP BY productId) AS limitP ON limitP.productId = pro.productId
      WHERE tblimages.productId = pro.productID
      GROUP BY pro.productID,pro.productName,price,expirationDate,unit,Pro.quantity;
       `,
    );

    if (_.isEmpty(productSelling))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return productSelling;
  },

  getProductPopularService: async () => {
    const productPopular = await queryDb(
      `SELECT Pro.productID, productName, price, expirationDate, unit, Pro.quantity, COUNT(Od.quantity) AS quantity_sold, MAX(Img.imageURL) AS imageURL
      FROM tblproduct AS Pro
      JOIN tblorderdetail AS Od ON Pro.productID = Od.productID
      JOIN tblimages AS Img ON Pro.productID = Img.productID
      GROUP BY Pro.productID, productName, price, expirationDate, unit, Pro.quantity
      ORDER BY quantity_sold DESC
      LIMIT 10;`,
    );

    return productPopular;
  },

  getProductDetailService: async (productID) => {
    const productDetail = await queryDb(
      `Select productID, productName, price, quantity, unit, productDescription from tblproduct where productID = ? `,
      [productID],
    );

    const images = await queryDb(
      `Select imageURL from tblimages where productID = ? `,
      [productID],
    );

    if (_.isEmpty(productDetail))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy sản phẩm');
    return { productDetail: productDetail[0], images };
  },
};

export default productService;
