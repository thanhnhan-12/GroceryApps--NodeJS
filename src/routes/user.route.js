import express from 'express';
import userController from '../controllers/user.controller';
const router = express.Router();

router.get(`/get-userinfor/:userID`, userController.getUserInfor);

router.put(`/update-userinforbyid/:userID`, userController.updateUserInforById);



export default router;
