`import Session from 'simple-auth/session'`

SessionWithCurrentUser = Session.extend
  currentUser: (()->
    userId = @get 'user_id'
    if !Ember.isEmpty(userId)
      store = @container.lookup('store:main')
      store.find 'user', userId
  ).property 'user_id'


# Takes two parameters: container and app
initialize = (container, app) ->
  container.register 'session:withCurrentUser', SessionWithCurrentUser

CustomizeSessionInitializer =
  name: 'customize-session'
  initialize: initialize

`export {initialize}`
`export default CustomizeSessionInitializer`
