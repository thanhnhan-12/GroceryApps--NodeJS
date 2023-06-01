import express from 'express';
import orderController from '../controllers/order.controller';
const router = express.Router();

router.get(`/get-allorders/:userID`, orderController.getAllOrders);

router.get(`/get-alluserorders/:orderStatus`, orderController.getAllUserOrders);

router.put(`/update-orderstatus`, orderController.updateListOrderStatus);

export default router;
