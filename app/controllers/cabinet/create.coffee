`import Ember from 'ember'`

CabinetCreateController = Ember.Controller.extend

  actions:
    save: ()->
      controller = @

      model = @get 'model'
      model.set 'created_at', new Date()
      model.set 'updated_at', new Date()

      @session.get('currentUser').then (user)->
        model.set 'user', user
        user.get('posts').then (posts)->
          model.save().then (post)->
            posts.pushObject post
            user.set 'updated_at', new Date()
            user.save().then ()->
              controller.transitionToRoute 'cabinet'
      .catch (err)->
        console.log err.stack


`export default CabinetCreateController`
