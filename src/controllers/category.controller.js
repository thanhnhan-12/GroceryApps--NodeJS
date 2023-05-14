import { catchAsync } from '../utils/catchAsync';
import categoryService from '../services/category.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const categoryController = {
  getCategoryService: catchAsync(async function (req, res, next) {
    const categoryList = await categoryService.getCategoryService();

    return res.status(httpStatus.OK).send({ categoryList });
  }),
};

export default categoryController;
