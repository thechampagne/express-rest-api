fs = require('fs')

keyValidation = (req, res, next) ->
  dbUsers = './database/users.json'
  db = fs.readFileSync(dbUsers)
  users = JSON.parse(db)
  api_key = req.header('x-api-key') or req.query.api_key
  userKey = users.find((user) ->
    user.api_key == api_key
  )
  if userKey
    next()
  else
    return res.status(401).send(error:
      status: 401
      message: 'Unauthorized.')
  return

module.exports = keyValidation