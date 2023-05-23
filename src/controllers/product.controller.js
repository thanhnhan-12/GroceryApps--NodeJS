import { catchAsync } from '../utils/catchAsync';
import productService from '../services/product.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const productController = {
  getProductService: catchAsync(async function (req, res, next) {
    const productNew = await productService.getProductService();

    return res.status(httpStatus.OK).send({ productNew });
  }),

  getProductSellingService: catchAsync(async function (req, res, next) {
    const productSelling = await productService.getProductSellingService();

    return res.status(httpStatus.OK).send({ productSelling });
  }),

  getProductPopularService: catchAsync(async function (req, res, next) {
    const productPopular = await productService.getProductPopularService();

    return res.status(httpStatus.OK).send({ productPopular });
  }),

  getProductDetailService: catchAsync(async function (req, res, next) {
    const {productDetail, images } = await productService.getProductDetailService(req.params.productID);

    return res.status(httpStatus.OK).send({ productDetail, images });
  }),

  getProductUpdateQuantity: catchAsync(async function (req, res, next) {
    
  }),

};

export default productController;
