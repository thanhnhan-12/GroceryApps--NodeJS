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
    const { productDetail, images } =
      await productService.getProductDetailService(req.params.productID);

    return res.status(httpStatus.OK).send({ productDetail, images });
  }),

  createProduct: catchAsync(async function (req, res, next) {
    const files = req.files;
    // console.log("", req.files);
    // console.log("", req.file);

    const createNewProduct = await productService.createProduct(
      req.body,
      files,
    );

    return res.status(httpStatus.OK).send(createNewProduct);
  }),

  getListAllProduct: catchAsync(async function (req, res, next) {
    const listAllProduct = await productService.getListAllProduct();

    return res.status(httpStatus.OK).send(listAllProduct);
  }),

  updateProductById: catchAsync(async function (req, res, next) {
    const productList = await productService.updateProductById(
      req.params.idProduct,
      req.body,
    );

    return res.status(httpStatus.OK).send(productList);
  }),

  findProductByName: catchAsync(async function (req, res, next) {
    const productList = await productService.findProductByName(req.params.productName);

    return res.status(httpStatus.OK).send(productList);
  }),
};

export default productController;
