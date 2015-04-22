`import Ember from 'ember'`
`import DataRoute from 'ember-data-route/mixins/data-route'`
`import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin'`

CabinetEditRoute = Ember.Route.extend DataRoute, AuthenticatedRouteMixin

`export default CabinetEditRoute`
