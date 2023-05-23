import httpStatus from 'http-status';
import { catchAsync } from '../utils/catchAsync';
import authService from '../services/auth.service';
import tokenService from '../services/token.service';

const authController = {
  login: catchAsync(async (req, res, next) => {
    const { email, password, fullName } = req.body;
    const id_role = 'user';
    const { users, message } = await authService.login(
      {
        email,
        password,
        fullName
      },
      id_role,
    );

    if (users) {
      const { accessToken } = tokenService.generateToken(users);

      res.send({
        users,

        accessToken,
      });
    }
  }),

  register: catchAsync(async (req, res, next) => {
    const { fullName, email, password } = req.body;
    console.log('Body: ', req.body);
    const { users, message } = await authService.register(req.body);

    if (users) {
      const { accessToken } = tokenService.generateToken(users);

      res.send({
        users,

        accessToken,
      });
    }
  }),
};

export default authController;
