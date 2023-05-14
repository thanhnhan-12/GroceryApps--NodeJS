import express from 'express';
import productController from '../controllers/product.controller';
const router = express.Router();

router.get('/get-product', productController.getProductService);

router.get('/get-productselling', productController.getProductSellingService);

router.get('/get-productpopular', productController.getProductPopularService);

export default router;
