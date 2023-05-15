import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const deliveryService = {
  getProvinceService: async () => {
    const province = await queryDb(`Select nameProvince from tblprovince `);

    if (_.isEmpty(province))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Tỉnh/ Thành');

    return province;
  },

  getDistrictService: async () => {
    const district = await queryDb(`Select nameDistrict from tbldistrict `);

    if (_.isEmpty(district))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Quận Huyện');

    return district;
  },

  getWardService: async () => {
    const ward = await queryDb(`Select nameWard from tblwards `);

    if (_.isEmpty(ward))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Phường Xã');

    return ward;
  },

};

export default deliveryService;
