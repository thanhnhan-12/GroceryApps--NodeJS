import { catchAsync } from '../utils/catchAsync';
import cartService from '../services/cart.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const cartController = {
  getCartService: catchAsync(async function (req, res, next) {
    const cartList = await cartService.getCartService(req.params.userID);

    return res.status(httpStatus.OK).send({ cartList });
  }),

  createCart: catchAsync(async function (req, res, next) {
    await cartService.createCart(req.body);

    return res.status(httpStatus.OK).send('Thêm giỏ hàng thành công');
  }),

  decreaseQuantity: catchAsync(async function (req, res, next) {
    await cartService.decreaseQuantity(req.body);

    return res.status(httpStatus.OK).send('Giảm số lượng thành công');
  }),

  deleteCart: catchAsync(async function (req, res, next) {
    await cartService.deleteCart(req.query);

    return res.status(httpStatus.OK).send('Xoá giỏ hàng thành công');
  }),

  deleteCarts: catchAsync(async function (req, res, next) {
    await cartService.deleteCarts(req.body);

    return res.status(httpStatus.OK).send('Xoá giỏ hàng thành công');
  }),

  payments: catchAsync(async function (req, res, next) {
    await cartService.payments(req.body);
    
    return res.status(httpStatus.OK).send('Thanh toán thành công');
  }),
};

export default cartController;
