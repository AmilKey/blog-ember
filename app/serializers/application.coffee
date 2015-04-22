`import DS from 'ember-data'`

ApplicationSerializer = DS.RESTSerializer.extend

  primaryKey: '_id'

  serializeId: (id)->
    id.toString()

  serializeIntoHash: (data, type, snapshot, options)->
    root = Ember.String.decamelize(type.typeKey)
    data[root] = @serialize(snapshot, options)

  serialize: (snapshot, options) ->
    json = {}
    snapshot.eachAttribute (name) ->
      json[name] = snapshot.attr(name)
      return
    snapshot.eachRelationship (name, relationship) ->
      if relationship.kind == 'hasMany'
        json[name] = snapshot.hasMany(name, ids: true)
      if relationship.kind == 'belongsTo'
        json[name] = snapshot.belongsTo(name, id: true)
      return
    if snapshot.id
      json._id = snapshot.id
    json


`export default ApplicationSerializer`
