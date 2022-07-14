validator = require('express-validator')
exists = require('./alreadyExists.coffee')
registerValidation = [
  validator.check('username').trim().notEmpty().withMessage('Username cannot be empty.').bail().isLength(min: 5).withMessage('Username should be at least 5 characters.').isLength(max: 32).withMessage('Username should be at maximum 32 characters.').bail().not().matches(/\s/g).withMessage('Invalid username.').bail().custom((username) ->
    userUsername = await exists.usernameExists(username)
    if userUsername
      throw new Error('Username already exists.')
    return
  )
  validator.check('email').trim().notEmpty().withMessage('Email cannot be empty.').bail().isEmail().withMessage('Invalid email.').normalizeEmail().toLowerCase().bail().custom((email) ->
    userEmail = await exists.emailExists(email)
    if userEmail
      throw new Error('Email already exists.')
    return
  )
  validator.check('password').trim().notEmpty().withMessage('Password cannot be empty.').bail().isLength(min: 5).withMessage('Password should be at least 5 characters.').isLength(max: 32).withMessage('Password should be at maximum 32 characters.').bail().not().matches(/\s/g).withMessage('Invalid password.')
]
module.exports = registerValidation