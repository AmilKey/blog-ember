`import Ember from 'ember'`
`import raw from 'ic-ajax'`
`import ENV from '../config/environment'`

RegisterController = Ember.Controller.extend

  actions:
    register: ()->

      model = @get('model')

      data = @getProperties('name', 'login', 'password')

      options =
        type: 'POST'
        data: JSON.stringify(data)
        contentType: 'application/json'

      # создаётся пользователь и привязывается к нему токен
      host      = ENV.APP.API.host
      namespace = ENV.APP.API.namespace

      raw(host+'/'+namespace+'/users', options).then (user)=>
        @get('session').authenticate 'simple-auth-authenticator:oauth2-password-grant',
          identification: @get 'login'
          password: @get 'password'
      .catch (err)->
        console.log err.stack


`export default RegisterController`
