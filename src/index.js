import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import routes from './routes';
import { errorConverter, errorHandler } from './middleware/error';

dotenv.config();

const app = express();

// config path images
app.use('/', express.static('public'));
app.use(cors());
app.use(morgan('dev'));
app.use(express.json());
app.use(bodyParser.json());

app.use(
  bodyParser.urlencoded({
    extended: true,
  }),
);

// v1 api routes
app.use('/api/v1', routes);

const port = process.env.PORT;

app.get('/', () => {
  res.send('Express + Nodejs Server');
});

// handle error
app.use(errorConverter);
app.use(errorHandler);

const http = require('http').Server(app);

http.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
