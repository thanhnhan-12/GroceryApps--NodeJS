import { catchAsync } from "../utils/catchAsync";
import categoryService from "../services/category.service";
import tokenService from "../services/token.service";
import httpStatus from "http-status";

const categoryController = {
  getCategoryService: catchAsync(
    async function(req, res, next) {
    const servicesCategory = await categoryService.getCategoryService();

    return res.status(httpStatus.OK).send({ servicesCategory });

  })

  
}

export default categoryController;