import jwt from 'jsonwebtoken';

const generateToken = (payload) => {
  const { id, isAdmin } = payload;

  const accessToken = jwt.sign(
    { id, isAdmin },
    process.env.ACCESS_TOKEN_SECRET + '',
    {
      expiresIn: '30s',
    }
  );

  const refreshToken = jwt.sign(
    { id, isAdmin },
    process.env.REFRESH_TOKEN_SECRET + '',
    {
      expiresIn: '1h',
    }
  );

  return { accessToken, refreshToken };
};

const tokenService = {
  generateToken,
};

export default tokenService;
