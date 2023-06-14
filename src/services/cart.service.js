import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const cartService = {
  getCartService: async (userID) => {
    const cart = await queryDb(
      `Select Pro.productID, Pro.productName, Pro.price, Pro.expirationDate, Pro.unit, C.quantity, Img.imageURL, C.cartID, C.userID 
      from tblproduct as Pro, tblimages as Img, tblcart as C
      where Pro.productID = C.productID and Pro.productID = Img.productID and C.userID = ?
      Group By Pro.productID
      `,
      [userID],
    );

    // if (_.isEmpty(cart))
    //   throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy giỏ hàng');
    return cart;
  },

  createCart: async (body) => {
    const { productID, userID, quantity } = body;
    const cart = await queryDb(
      `Select * from tblcart where productID = ? and userID = ? `,
      [productID, userID],
    );

    console.log({ cart });

    if (_.isEmpty(cart)) {
      const cart = await queryDb(
        `Insert into tblcart(productID, userID, quantity) values (?, ?, ?) `,
        [productID, userID, quantity],
      );
    } else {
      const cartitem = await queryDb(
        `Select * from tblcart where productID = ? and userID = ? `,
        [productID, userID],
      );
      let product = await queryDb(
        `Select * from tblproduct where productID = ? `,
        [productID],
      );

      const nowProductQuantity = product[0].quantity;
      const nowCartQuantity = cartitem[0].quantity + quantity;
      console.log({ nowCartQuantity, nowProductQuantity });
      if (nowProductQuantity < nowCartQuantity) {
        throw new ApiError(httpStatus.BAD_REQUEST, 'Lỗi Số lượng');
      }

      const newQuantity = cartitem[0]?.quantity + quantity;
      await queryDb(
        `Update tblCart set quantity = ? where productID = ? and userID = ? `,
        [newQuantity, productID, userID],
      );
    }
  },

  decreaseQuantity: async (body) => {
    const { productID, userID, quantity } = body;
    const cart = await queryDb(
      `Select * from tblcart where productID = ? and userID = ? `,
      [productID, userID],
    );

    console.log({ cart });
    const newQuantity = cart[0]?.quantity - quantity;

    if (quantity > cart[0]?.quantity) {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Lỗi Số lượng');
    }

    if (quantity === cart[0]?.quantity) {
      const cart = await queryDb(
        `Delete from tblcart where productID = ? and userID = ? `,
        [productID, userID],
      );
    }

    if (_.isEmpty(cart)) {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tồn tại sản phẩm');
    } else {
      console.log(newQuantity);
      const cart = await queryDb(
        `Update tblCart set quantity = ? where productID = ? and userID = ? `,
        [newQuantity, productID, userID],
      );
    }
  },

  deleteCart: async (query) => {
    const { cartID, userID } = query;

    const cart = await queryDb(
      `Select * from tblcart where cartID = ? and userID = ? `,
      [cartID, userID],
    );

    if (_.isEmpty(cart)) {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tồn tại sản phẩm');
    } else {
      const cart = await queryDb(
        `Delete from tblcart where cartID = ? and userID = ? `,
        [cartID, userID],
      );
    }
  },

  payments: async (body) => {
    const orderStatus = 0;
    const payMethod = 'Tiền mặt';
    const orderDate = new Date();

    const { totalPrice, userID, productCart, userAddressID } = body;

    const order = await queryDb(
      `Insert into tblorder(orderStatus, payMethod, totalPrice, orderDate, userID, userAddressID) values(?, ?, ?, ?, ?, ?); `,
      [orderStatus, payMethod, totalPrice, orderDate, userID, userAddressID],
    );

    const select = await queryDb(
      `SELECT * FROM tblOrder WHERE orderID = LAST_INSERT_ID();`,
    );

    // console.log('Select ', select);

    const orderID = select[0].orderID;

    let insertStatement =
      'INSERT INTO tblOrderDetail (productID, quantity, orderID) VALUES ';

    for (let i = 0; i < productCart.length; i++) {
      const { productID, quantity } = productCart[i];
      insertStatement += `('${productID}', ${quantity}, ${orderID} )`;

      let update = await queryDb(
        `Select * from tblproduct where productID = ? `,
        [productID],
      );
      // console.log("Log", update);
      const newQuantity = update[0].quantity - quantity;

      console.log("Log: ", newQuantity);

      await queryDb(`Update tblproduct set quantity = ? where productID = ? `, [
        newQuantity,
        productID,
      ]);

      if (i !== productCart.length - 1) {
        insertStatement += ', ';
      }
    }

    const orderDetail = await queryDb(insertStatement);

    await cartService.deleteCarts({
      listCartID: [...productCart.map((item) => item.cartID)],
      userID,
    });
  },

  deleteCarts: async (body) => {
    const { listCartID, userID } = body;

    let deleteCarts = `Delete from tblcart where cartID in (${[
      ...listCartID,
    ]}) `;

    await queryDb(deleteCarts);

    console.log('Log: ', deleteCarts);
  },
};

export default cartService;
