import mysql from 'mysql2/promise';
import { RowDataPacket } from 'mysql2';
import config from './connect_db';

const pool = mysql.createPool(config.db);

async function queryDb(sql, params) {
  const connection = await pool.getConnection();
  try {
    const [results] = await connection.query(sql, params);

    return results;
  } finally {
    connection.release();
  }
}
export default queryDb;
