`import DS from 'ember-data'`
`import ENV from '../config/environment'`

ApplicationAdapter = DS.RESTAdapter.extend
  host:  ENV.APP.API.host
  namespace: ENV.APP.API.namespace

  coalesceFindRequests: yes

`export default ApplicationAdapter`
