`import DS from 'ember-data'`

{ attr, belongsTo } = DS

Post = DS.Model.extend
  title:       attr 'string'
  description: attr 'string'

  created_at:  attr 'date'
  updated_at:  attr 'date'

  # Relationships
  user: belongsTo 'user', async: yes


`export default Post`