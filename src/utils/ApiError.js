class ApiError extends Error {
  statusCode;

  constructor(statusCode, message, stack) {
    super(message);
    this.statusCode = statusCode;
    if (stack) {
      this.stack = stack;
    } else {
      console.log("banasd");
      Error.captureStackTrace(this, this.constructor);
    }
  }
}

export default ApiError;
