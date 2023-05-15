import express from 'express';
import deliveryController from '../controllers/delivery.controller' ;
const router = express.Router();

router.get('/get-province',  deliveryController.getProvinceService);

router.get('/get-district', deliveryController.getDistrictService);

router.get('/get-ward', deliveryController.getWardService);

export default router;
