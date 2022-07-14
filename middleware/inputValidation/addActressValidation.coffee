validator = require('express-validator')
addActressValidation = [
  validator.check('name').trim().notEmpty().withMessage('Name cannot be empty.')
  validator.check('birth_date').trim().notEmpty().withMessage('Birth date cannot be empty.').bail().isISO8601().withMessage('Birth date format should look like this yyyy-mm-dd.').bail().isBefore().withMessage('The date should be before this day.')
]
module.exports = addActressValidation