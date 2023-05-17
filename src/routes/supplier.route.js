import express from 'express';
import supplierController from '../controllers/supplier.controller' ;
const router = express.Router();

router.get('/get-supplier', supplierController.getSupplierService);

export default router