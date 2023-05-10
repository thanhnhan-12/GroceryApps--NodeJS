import queryDb from "../config/db";
import ApiError from "../utils/ApiError";
import httpStatus from "http-status";

var _ = require("lodash");
var bcrypt = require("bcrypt");

const productService = {
  product: async (body) => {
    const { productName , price, unit } = body;
    console.log({ body });
    const user = await queryDb("select * from tblproduct where productID=?", [email]);
  },
};
