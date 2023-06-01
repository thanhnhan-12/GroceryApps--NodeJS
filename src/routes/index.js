import authRoute from './auth.route';
import productRoute from './product.route';
import categoryRoute from './category.route';
import deliveryRoute from './delivery.route';
import suppilerRoute from './supplier.route';
import cartRoute from './cart.route';
import adminRoute from './admin.route';
import userRoute from './user.route';
import orderRoute from './order.route';

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

  {
    path: '/delivery',
    route: deliveryRoute,
  },

  {
    path: '/supplier',
    route: suppilerRoute,
  },

  {
    path: '/cart',
    route: cartRoute,
  },

  {
    path: '/delivery',
    route: deliveryRoute,
  },

  {
    path: '/order',
    route: orderRoute,
  },

  {
    path: '/user',
    route: userRoute,
  },

  {
    path: '/admin',
    route: adminRoute,
  },
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

// export default router;

module.exports = router;
