import { catchAsync } from '../utils/catchAsync';
import categoryService from '../services/category.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const categoryController = {
  getCategoryService: catchAsync(async function (req, res, next) {
    const categoryList = await categoryService.getCategoryService();

    return res.status(httpStatus.OK).send({ categoryList });
  }),

  getProductCategoryType: catchAsync(async function (req, res, next) {
    const categoryTypeList = await categoryService.getProductCategoryType(req.params.categoryID);

    return res.status(httpStatus.OK).send({ categoryTypeList });
  }),
};

export default categoryController;
