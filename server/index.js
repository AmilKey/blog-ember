// To use it create some files under `mocks/`
// e.g. `server/mocks/ember-hamsters.js`
//
// module.exports = function(app) {
//   app.get('/ember-hamsters', function(req, res) {
//     res.send('hello');
//   });
// };

var bodyParser = require('body-parser');
var globSync   = require('glob').sync;
var routes     = globSync('./routes/**/*.js', { cwd: __dirname }).map(require);
var mocks      = globSync('./mocks/**/*.js', { cwd: __dirname }).map(require);
var proxies    = globSync('./proxies/**/*.js', { cwd: __dirname }).map(require);

module.exports = function(app) {
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({
    extended: true
  }));

  routes.forEach(function(route) { route(app); });
  mocks.forEach(function(route) { route(app); });
  proxies.forEach(function(route) { route(app); });
};