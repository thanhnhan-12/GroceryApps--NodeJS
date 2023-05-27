import queryDb from '../config/db';
import ApiError from '../utils/ApiError';
import httpStatus from 'http-status';

var _ = require('lodash');
var bcrypt = require('bcrypt');

const deliveryService = {
  getProvinceService: async () => {
    const province = await queryDb(
      `Select  provinceID, nameProvince from tblprovince `,
    );

    if (_.isEmpty(province))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Tỉnh/ Thành');

    return province;
  },

  getDistrictService: async () => {
    const district = await queryDb(
      `Select districtID ,nameDistrict from tbldistrict `,
    );

    if (_.isEmpty(district))
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tìm thấy Quận Huyện');

    return district;
  },

  getWardService: async (districtID) => {
    const ward = await queryDb(
      `Select WardsID, nameWard from tblwards where districtID = ? `,
      [districtID],
    );

    return ward;
  },

  updateUserAddress: async (body) => {
    const { userNameAddress, userID, WardsID } = body;
    console.log('Body: ', body);
    const address = await queryDb(
      `Insert into tblUserAddress(userNameAddress, userID, WardsID) values (?, ?, ?)  `,
      [userNameAddress, userID, WardsID],
    );

    return address;
  },
  updateAddressById: async (idAddress, body) => {
    const { userNameAddress, WardsID } = body;
    console.log(':', body, idAddress);
    const address = await queryDb(
      `Update tblUserAddress set userNameAddress = ?, WardsID = ? where userAddressID = ? `,
      [userNameAddress, WardsID, idAddress],
    );

    return address;
  },

  getUserAddress: async (userID) => {
    const addressList = await queryDb(
      `Select U.userAddressID, U.userNameAddress, P.nameProvince, D.nameDistrict, W.nameWard, P.provinceID as province, D.districtID as district, W.WardsID as ward 
      from tblProvince as P, tblDistrict as D, tblWards as W , tblUserAddress as U
      where P.provinceID = D.provinceID and D.districtID = W.districtID and W.WardsID = U.WardsID and U.userID = ?
      Group by U.userAddressID
      `,
      [userID],
    );

    return addressList;
  },

  deleteUserAddress: async (query) => {
    const { userAddressID, userID } = query;

    const addressList = await queryDb(
      ` Select * from tblUserAddress where userAddressID = ? and userID = ?
      `,
      [userAddressID, userID],
    );

    if (_.isEmpty(addressList)) {
      throw new ApiError(httpStatus.BAD_REQUEST, 'Không tồn tại địa chỉ');
    } else {
      const addressList = await queryDb(
        `Delete from tbluseraddress where userAddressID = ? and userID = ? `,
        [userAddressID, userID],
      );
    }
  },



};

export default deliveryService;
