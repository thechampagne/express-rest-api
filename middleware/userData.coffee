fs = require('fs')

userData = (req, res) ->
  dbUsers = './database/users.json'
  db = fs.readFileSync(dbUsers)
  users = JSON.parse(db)
  username = req.body.username
  password = req.body.password
  user = users.find((user) ->
    user.username == username and user.password == password
  )
  if user
    res.status(200).send data: user
  else
    return res.status(400).send(error:
      status: 400
      message: 'Incorrect username or password.')
  return

module.exports = userData