import authRoute from './auth.route';

import express from 'express';

const router = express.Router();

console.log("redner rutes")


const defaultRoutes = [
  {
    path: '/auth',
    route: authRoute,
  },
  
];

defaultRoutes.forEach((route) => {
  router.use(route.path, route.route);
});

// export default router;

module.exports = router;

