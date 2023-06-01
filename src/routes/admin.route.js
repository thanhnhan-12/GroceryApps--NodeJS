import express from 'express';
import adminController from '../controllers/admin.controller';
import  upload  from '../middleware/upload';
const router = express.Router();

router.get('/get-alluser', adminController.getAllUser);

router.put(`/update-accountbyid/:idAccount`, adminController.updateAccountById);

export default router;