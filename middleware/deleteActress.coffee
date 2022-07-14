fs = require('fs')

deleteActress = (req, res) ->
  dbActresses = './database/actresses.json'
  db = fs.readFileSync(dbActresses)
  actresses = JSON.parse(db)
  id = +req.params.id
  actress = actresses.findIndex((actress) ->
    actress.id == id
  )
  if actress >= 0
    actresses.splice actress, 1
    deletedActress = JSON.stringify(actresses, null, 3)
    fs.writeFileSync dbActresses, deletedActress, (err) ->
      if err
        throw err
      return
    res.status(201).send data: message: "Actress #{id} has been deleted."
  else
    res.status(404).send error:
      status: 404
      message: "Actress #{id} not found."

module.exports = deleteActress