import { catchAsync } from '../utils/catchAsync';
import orderService from '../services/order.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const orderController = {
  getAllOrders: catchAsync(async function (req, res, next) {
    const orderList = await orderService.getAllOrders(req.params.userID);

    return res.status(httpStatus.OK).send(orderList);
  }),

  getAllUserOrders: catchAsync(async function (req, res, next) {
    const userOrderList = await orderService.getAllUserOrders(
      req.params.orderStatus,
    );

    return res.status(httpStatus.OK).send(userOrderList);
  }),

  updateListOrderStatus: catchAsync(async function (req, res, next) {
    const userOrderStatus = await orderService.updateListOrderStatus(req.body);

    return res.status(httpStatus.OK).send(userOrderStatus);
  }),
};

export default orderController;
