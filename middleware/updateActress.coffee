fs = require('fs')

updateActress = (req, res) ->
  dbActresses = './database/actresses.json'
  db = fs.readFileSync(dbActresses)
  actresses = JSON.parse(db)
  id = +req.params.id
  name = req.body.name
  birth_date = req.body.birth_date
  actress = actresses.findIndex((actress) ->
    actress.id == id
  )
  if actress >= 0
    actresses[actress] =
      id: id
      name: name
      birth_date: birth_date
    updatedActress = JSON.stringify(actresses, null, 3)
    fs.writeFileSync dbActresses, updatedActress, (err) ->
      if err
        throw err
      return
    res.status(201).send data: message: "Actress #{id} has been updated."
  else
    res.status(404).send error:
      status: 404
      message: "Actress #{id} not found."

module.exports = updateActress