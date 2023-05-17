import { catchAsync } from '../utils/catchAsync';
import supplierService from '../services/supplier.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const supplierController = {
  getSupplierService: catchAsync(async function(req, res, next) {
    const supplierList = await supplierService.getSupplierService();

    return res.status(httpStatus.OK).send({ supplierList })
  }),
};

export default supplierController;