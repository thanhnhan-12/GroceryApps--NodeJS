import express from 'express';
import categoryController from '../controllers/category.controller';
const router = express.Router();

router.get('/get-category', categoryController.getCategoryService);

export default router;
