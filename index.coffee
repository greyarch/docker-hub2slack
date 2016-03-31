express = require 'express'
bodyParser = require 'body-parser'
request = require 'request'

endpoints = require './endpoints'

port = process.env.PORT || 80

app = express()
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: true

app.post '/', (req, res) ->
  if req.body?.push_data and req.body?.repository
    {push_data: {tag}, repository: {repo_name}} = req.body
    endpoint = endpoints?[repo_name]?[tag]
    request.post
      url: endpoint
      json:
        text: "New version of #{repo_name}:#{tag} is available on docker hub."
  res.send 'Done!'

app.listen port, ->
  console.log "Docker Hub Webhook server is listening on port #{port}!"
