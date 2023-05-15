import { catchAsync } from '../utils/catchAsync';
import deliveryService from '../services/delivery.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const deliveryController = {
  getProvinceService: catchAsync(async function (req, res, next) {
    const provinceList = await deliveryService.getProvinceService() ;

    return res.status(httpStatus.OK).send({ provinceList });
  }),

  getDistrictService: catchAsync(async function (req, res, next) {
    const districtList = await deliveryService.getDistrictService() ;

    return res.status(httpStatus.OK).send({ districtList });
  }),

  getWardService: catchAsync(async function (req, res, next) {
    const wardList = await deliveryService.getWardService() ;

    return res.status(httpStatus.OK).send({ wardList });
  }),

};

export default deliveryController;