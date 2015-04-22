`import Ember from 'ember'`

IndexRoute = Ember.Route.extend

  model: ()->
    @store.find('post').then (posts)->
      Em.ArrayProxy.createWithMixins Em.SortableMixin,
        sortProperties: ['updated_at']
        sortAscending: no
        content: posts
    .catch (err)->
      console.log err.stack

`export default IndexRoute`
