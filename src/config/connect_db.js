import mysql from 'mysql2/promise';
// // create the connection to database

const config = {
  db: {
    host: 'localhost',
    user: 'root',
    password: 'nhan',
    database: 'groceryapps',
  },
  listPerPage: 10,
};
export default config;
