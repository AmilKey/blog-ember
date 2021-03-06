module.exports = function(app) {
  app.post('/token', function(req, res) {

    var user = {
      id: 1,
      name: 'name',
      posts: [1,2]
    };

    res.setHeader('Content-Type', 'application/json');

    if (req.body.grant_type === 'password') {
      if (req.body.username === 'l' && req.body.password === 'p') {
        res.send({ access_token: 'secret token!', user: user });
      } else {
        res.status(400).send({ error: 'invalid_grant' });
      }
    } else {
      res.status(400).send({ error: 'unsupported_grant_type' });
    }
  });

  app.post('/revoke', function(req, res) {
    if (req.body.token_type_hint === 'access_token' || req.body.token_type_hint === 'refresh_token') {
      res.send('');
    } else {
      res.status(400).send({ error: 'unsupported_token_type' });
    }
  })
};
