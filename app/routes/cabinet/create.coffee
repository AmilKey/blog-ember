`import Ember from 'ember'`
`import DataRoute from 'ember-data-route/mixins/data-route'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

CabinetCreateRoute = Ember.Route.extend DataRoute, AuthenticatedRouteMixin,

  model: ()->
    @store.createRecord 'post'


`export default CabinetCreateRoute`
