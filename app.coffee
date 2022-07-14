express = require('express')
app = express()
cors = require('cors')
port = process.env.PORT or 3000
router = require('./routes/router.coffee')
app.use express.json()
app.use express.urlencoded(extended: false)
app.use cors()
app.use '/', router, (req, res) ->
  res.status(404).send error:
    status: 404
    message: 'Not found.'
  return
app.listen port, (err) ->
  if err
    console.error 'Failure to launch the server.'
    return
  console.log "Listening on #{port}"
  return