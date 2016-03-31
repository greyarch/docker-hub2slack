express = require 'express'
bodyParser = require 'body-parser'

port = process.env.PORT || 80

app = express()
app.use bodyParser.json()

app.post '/', (req, res) ->
  console.log req.body
  res.send 'Done!'

app.listen port, ->
  console.log "Docker Hub Webhook server listening on port #{port}!"
