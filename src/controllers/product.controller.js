import { catchAsync } from "../utils/catchAsync";
import productService from "../services/product.service";
import tokenService from "../services/token.service";

const productController = {
  getProductService: catchAsync(
    async (req: Request, res: Response, next: NextFunction) => {
      const services = await productService.getProductService();

      return res.status(httpStatus.OK).send({ services });
    }
  );

  
}

export default productController;