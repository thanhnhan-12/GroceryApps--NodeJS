// import { typeImage } from '../constants/typeFile';

// const multer = require('multer');

// const storage = multer.diskStorage({
//   destination: (_req, file, callBack) => {
//     console.log("Fi", file);
//     callBack(null, 'public/');
//   },
//   filename: (_req, file, callBack) => {
//     const uniqueSuffix = `${Date.now() + file.originalname}`;
//     callBack(null, uniqueSuffix);
//   },
// });

// export const upload = multer({
//   storage,
//   fileFilter: (_req, file, callBack) => {
//     console.log("File", file);
//     if (
//       file.mimetype === typeImage.PNG ||
//       file.mimetype === typeImage.JPG ||
//       file.mimetype === typeImage.JPEG
//     )
//       callBack(null, true);
//     else {
//       callBack(null, false);
//       return callBack(new Error('Only .png, .jpg and .jpeg format allowed!'));
//     }
//   },
// });

import multer from 'multer';
import path from "path";
const upload = (url) => {
    var storage = multer.diskStorage({
        destination: (req, file, callBack) => {
            callBack(null, 'public/' + url);   // './public/images/' directory name where save the file
        },
        filename: (req, file, callBack) => {
            const ext = path.extname(file.originalname);
            const newName = `${Date.now()}-${Math.round(Math.random() * 1E9)}${ext}`;
            callBack(null, newName);
        }
    })

    const upload = multer({
        storage: storage
    });
    return upload
}
export default upload