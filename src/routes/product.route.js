import express from 'express';
import productController from '../controllers/product.controller';
import  upload  from '../middleware/upload';
const router = express.Router();

router.get('/get-product', productController.getProductService);

router.get('/get-productselling', productController.getProductSellingService);

router.get('/get-productpopular', productController.getProductPopularService);

router.get(
  '/get-productdetail/:productID',
  productController.getProductDetailService,
);

router.post(
  '/createproduct',
  upload("medias").array('medias', 12),
  productController.createProduct,
);

router.get('/get-listallproduct', productController.getListAllProduct);

export default router;
