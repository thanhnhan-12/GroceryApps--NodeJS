import express from 'express';
import cartController from '../controllers/cart.controller' ;
const router = express.Router();

router.get('/get-cart/:userID',  cartController.getCartService);

router.post('/create-cart', cartController.createCart );

router.post('/decrease-quantity', cartController.decreaseQuantity );

router.delete('/delete-cart', cartController.deleteCart);

router.post('/delete-carts', cartController.deleteCarts);

router.post('/payments', cartController.payments)

export default router;
