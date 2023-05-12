import authRoute from './auth.route';
import productRoute from './product.route';
import categoryRoute from './category.route';

import express from 'express';

const router = express.Router();

console.log('Render routes');

const defaultRoutes = [
  {
    path: '/auth',
    route: authRoute,
  },

  {
    path: '/product',
    route: productRoute,
  },

  {
    path: '/category',
    route: categoryRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

// export default router;

module.exports = router;
