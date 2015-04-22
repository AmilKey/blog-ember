`import DS from 'ember-data'`

{ attr, belongsTo } = DS

Apikey = DS.Model.extend
  token:      attr 'string'
  token_type: attr 'string'

  # Relationships
  user:  belongsTo 'user', async: yes

`export default Apikey`
