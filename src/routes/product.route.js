import express from 'express';
import productController from '../controllers/product.controller';
const router = express.Router();

router.get('/get-product', productController.getProductService);

export default router;
