// Used by database migrations
const getConfiguration = require('./src/app.config.ts').default;

const config = getConfiguration().typeorm;

module.exports = config;
