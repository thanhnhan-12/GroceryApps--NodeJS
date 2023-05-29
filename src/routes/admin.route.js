import express from 'express';
import adminController from '../controllers/admin.controller';
import  upload  from '../middleware/upload';
const router = express.Router();

router.get('/get-alluser', adminController.getAllUser);

export default router;