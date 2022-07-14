fs = require('fs')

registerUser = (_username, _email, _password, req) ->
  dbUsers = './database/users.json'
  db = fs.readFileSync(dbUsers)
  users = JSON.parse(db)
  numId = Math.max.apply(Math, users.map((number) ->
    number.id
  ))
  uniqueId = if numId < 1 then 1 else numId + 1

  key = ->
    arr = []
    i = 0
    while i < 30
      arr[i] = undefined
      i++
    arr.map((e) ->
      (Math.random() * 36 | 0).toString 36
    ).join ''

  user = 
    id: uniqueId
    username: _username
    email: _email
    password: _password
    api_key: key()
  users.push user
  newUser = JSON.stringify(users, null, 3)
  fs.writeFileSync dbUsers, newUser, (err) ->
    if err
      throw err
    return
  user

module.exports = registerUser