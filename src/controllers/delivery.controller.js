import { catchAsync } from '../utils/catchAsync';
import deliveryService from '../services/delivery.service';
import tokenService from '../services/token.service';
import httpStatus from 'http-status';

const deliveryController = {
  getProvinceService: catchAsync(async function (req, res, next) {
    const provinceList = await deliveryService.getProvinceService();

    return res.status(httpStatus.OK).send({ provinceList });
  }),

  getDistrictService: catchAsync(async function (req, res, next) {
    const districtList = await deliveryService.getDistrictService();

    return res.status(httpStatus.OK).send({ districtList });
  }),

  getWardService: catchAsync(async function (req, res, next) {
    const wardList = await deliveryService.getWardService(
      req.params.districtID,
    );

    return res.status(httpStatus.OK).send({ wardList });
  }),

  updateUserAddress: catchAsync(async function (req, res, next) {
    const userAddress = await deliveryService.updateUserAddress(req.body);

    return res.status(httpStatus.OK).send(userAddress);
  }),

  getUserAddress: catchAsync(async function (req, res, next) {
    const addressList = await deliveryService.getUserAddress(req.params.userID);

    return res.status(httpStatus.OK).send(addressList);
  }),

  updateAddressById: catchAsync(async function (req, res, next) {
    const addressList = await deliveryService.updateAddressById(
      req.params.idAddress,
      req.body,
    );

    return res.status(httpStatus.OK).send(addressList);
  }),

  deleteUserAddress: catchAsync(async function (req, res, next) {
    await deliveryService.deleteUserAddress(req.query);

    return res.status(httpStatus.OK).send('Xoá địa chỉ thành công');
  }),
};

export default deliveryController;
