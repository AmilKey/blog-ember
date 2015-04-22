`import DS from 'ember-data'`

{ attr, hasMany, belongsTo } = DS

User = DS.Model.extend

  name:        attr 'string'

  created_at:  attr 'date'
  updated_at:  attr 'date'

  # Relationships
  posts:   hasMany   'post', async: yes
  apikey:  belongsTo 'apikey', async: yes

`export default User`