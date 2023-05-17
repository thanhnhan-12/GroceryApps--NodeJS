import express from 'express';
import cartController from '../controllers/cart.controller' ;
const router = express.Router();

router.get('/get-cart',  cartController.getCartService);



export default router;
