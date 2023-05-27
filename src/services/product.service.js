import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');
const uniqid = require('uniqid');

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

  getListAllProduct: async () => {
    const listAllProduct = await queryDb(
      `Select P.productName, P.price, P.quantity, P.expirationDate, P.unit, P.productDescription, P.categoryID, I.imageURL 
      from tblproduct as P, tblimages as I 
      where P.productID = I.productID 
      Group by P.productID;
      `,
    );

    return listAllProduct;
  },

  createProduct: async (body, files) => {
    const {
      productName,
      price,
      quantity,
      expirationDate,
      unit,
      productDescription,
      importDate,
      importPrice,
      categoryID,
      dateManufactured,
    } = body;

    const productID = uniqid();

    console.log('Files: ', files);

    await queryDb(
      `Insert into tblProduct(productID, productName, price, quantity, expirationDate, unit, 
        productDescription, importDate, importPrice, categoryID, dateManufactured) 
      values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)  `,
      [
        productID,
        productName,
        price,
        quantity,
        expirationDate,
        unit,
        productDescription,
        importDate,
        importPrice,
        categoryID,
        dateManufactured,
      ],
    );

    let insertStatement = 'insert into tblImages(imageURL, productID) values ';

    for (let i = 0; i < files.length; i++) {
      const { filename } = files[i];
      insertStatement += `('${filename}', '${productID}')`;

      if (i !== files.length - 1) {
        insertStatement += ', ';
      }
    }

    const orderDetail = await queryDb(insertStatement);

    return body;
  },
};

export default productService;
