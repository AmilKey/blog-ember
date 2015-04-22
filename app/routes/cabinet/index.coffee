`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

CabinetIndexRoute = Ember.Route.extend AuthenticatedRouteMixin,

  model: ()->
    @session.get('currentUser').then (user)->
      user.get('posts')
    .catch (err)->
      console.log err.stack

`export default CabinetIndexRoute`
