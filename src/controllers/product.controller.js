import { catchAsync } from "../utils/catchAsync";
import productService from "../services/product.service";
import tokenService from "../services/token.service";
import httpStatus from "http-status";

const productController = {
  getProductService: catchAsync(
    async function(req, res, next) {
    const servicesProduct = await productService.getProductService();

    return res.status(httpStatus.OK).send({ servicesProduct });

  })

  
}

export default productController;