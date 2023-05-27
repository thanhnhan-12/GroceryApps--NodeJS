import express from 'express';
import deliveryController from '../controllers/delivery.controller' ;
const router = express.Router();

router.get('/get-province',  deliveryController.getProvinceService);

router.get('/get-district', deliveryController.getDistrictService);

router.get('/get-ward/:districtID', deliveryController.getWardService);

router.post('/update-useraddress', deliveryController.updateUserAddress);

router.get('/get-addresslist/:userID', deliveryController.getUserAddress);

router.put('/update-addressbyid/:idAddress', deliveryController.updateAddressById);

router.delete('/delete-useraddress', deliveryController.deleteUserAddress);

export default router;
