var _ = require('lodash')

module.exports = function(app) {
  var express = require('express');
  var postRouter = express.Router();

  var posts = [
        {
            id: 1,
            title: 'title 1',
            description: 'description description 1',
            created_at: new Date(),
            updated_at: new Date(),
            user: 1,
        },{
            id: 2,
            title: 'title 2',
            description: 'description description 2',
            created_at: new Date(),
            updated_at: new Date(),
            user: 1,
        },{
            id: 3,
            title: 'title 3',
            description: 'description description 3',
            created_at: new Date(),
            updated_at: new Date(),
            user: 1,
        },{
            id: 4,
            title: 'title 4',
            description: 'description description 4',
            created_at: new Date(),
            updated_at: new Date(),
            user: 2,
        },{
            id: 5,
            title: 'title 5',
            description: 'description description 5',
            created_at: new Date(),
            updated_at: new Date(),
            user: 2,
        }
      ]

  postRouter.get('/', function(req, res) {
    res.send({
      'posts': posts
    });
  });

  postRouter.post('/', function(req, res) {
    var post = req.body;
    post.post.id = 10;
    res.status(201).send(post);
  });

  postRouter.get('/:id', function(req, res) {
    res.send({
      'post': _.findWhere(posts, {'id': Number(req.params.id)})
    });
  });

  postRouter.put('/:id', function(req, res) {
    res.status(200).send(req.body);
  });

  postRouter.delete('/:id', function(req, res) {
    res.status(204).end();
  });

  app.use('/api/posts', postRouter);
};
