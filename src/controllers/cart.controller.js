import { catchAsync } from '../utils/catchAsync';
import cartService from '../services/cart.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const cartController = {
  getCartService: catchAsync(async function (req, res, next) {
    const cartList = await cartService.getCartService() ;

    return res.status(httpStatus.OK).send({ cartList });
  }),
};

export default cartController;