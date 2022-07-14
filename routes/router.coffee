express = require('express')
router = express.Router()
fs = require('fs')
validator = require('express-validator')
keyValidation = require('../middleware/keyValidation.coffee')
addActress = require('../middleware/addActress.coffee')
registerUser = require('../middleware/registerUser.coffee')
deleteActress = require('../middleware/deleteActress.coffee')
updateActress = require('../middleware/updateActress.coffee')
userData = require('../middleware/userData.coffee')
registerValidation = require('../middleware/inputValidation/registerValidation.coffee')
addActressValidation = require('../middleware/inputValidation/addActressValidation.coffee')
dbActresses = './database/actresses.json'
dbactress = fs.readFileSync(dbActresses)
actresses = JSON.parse(dbactress)
dbUsers = './database/users.json'
dbuser = fs.readFileSync(dbUsers)
users = JSON.parse(dbuser)
router.get '/', (req, res) ->
  res.status(200).send data:
    status: 200
    message: 'Actresses API.'
  return
router.get '/actresses', keyValidation, (req, res) ->
  res.status(200).send data: actresses
  return
router.get '/actresses/:id', keyValidation, (req, res) ->
  id = +req.params.id
  actress = actresses.find((actress) ->
    actress.id == id
  )
  if actress
    res.status(200).send data: actress
  else
    res.status(404).send error:
      status: 404
      message: "Actress #{id} not found."
router.post '/actresses', keyValidation, addActressValidation, (req, res) ->
  errors = validator.validationResult(req)
  if !errors.isEmpty()
    return res.status(400).json(errors: errors.array())
  name = req.body.name
  birth_date = req.body.birth_date
  actress = addActress(name, birth_date, req)
  res.status(201).send data: actress
  return
router.post '/register', registerValidation, (req, res) ->
  errors = validator.validationResult(req)
  if !errors.isEmpty()
    return res.status(400).json(errors: errors.array())
  username = req.body.username
  email = req.body.email
  password = req.body.password
  user = registerUser(username, email, password, req)
  res.status(201).send data: user
  return
router.post '/user', userData
router.put '/actresses/:id', keyValidation, updateActress
router.delete '/actresses/:id', keyValidation, deleteActress
module.exports = router