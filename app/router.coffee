`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @route 'login'
  @route 'register'

  @route 'post', path: 'posts/:post_id'
  @resource 'cabinet', ()->
    @route 'create'
    @route 'edit', path: 'post/:post_id'

`export default Router`
