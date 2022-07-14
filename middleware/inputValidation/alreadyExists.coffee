fs = require('fs')

usernameExists = (username) ->
  dbUsers = './database/users.json'
  db = fs.readFileSync(dbUsers)
  users = JSON.parse(db)
  userUsername = await users.find((user) ->
    user.username == username
  )
  userUsername

emailExists = (email) ->
  dbUsers = './database/users.json'
  db = fs.readFileSync(dbUsers)
  users = JSON.parse(db)
  userEmail = await users.find((user) ->
    user.email == email
  )
  userEmail

module.exports =
  usernameExists: usernameExists
  emailExists: emailExists