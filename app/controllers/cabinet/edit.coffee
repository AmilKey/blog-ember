`import Ember from 'ember'`

CabinetEditController = Ember.Controller.extend

  actions:
    save: ()->
      model = @get 'model'
      model.set 'updated_at', new Date()
      model.save()

    delete: ()->
      post = @get 'model'
      post.destroyRecord().then ()=>
        @session.get('currentUser').then (user)=>
          user.get('posts').then (posts)=>
            posts.removeObject post
            user.save().then ()=>
              @transitionToRoute 'cabinet'
      .catch (err)->
        console.log err.stack

`export default CabinetEditController`
