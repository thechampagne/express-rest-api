fs = require('fs')

addActress = (_name, _birth, req) ->
  dbActresses = './database/actresses.json'
  db = fs.readFileSync(dbActresses)
  actresses = JSON.parse(db)
  numId = Math.max.apply(Math, actresses.map((number) ->
    number.id
  ))
  uniqueId = if numId < 1 then 1 else numId + 1
  actress = 
    id: uniqueId
    name: _name
    birth_date: _birth
  actresses.push actress
  newActress = JSON.stringify(actresses, null, 3)
  fs.writeFileSync dbActresses, newActress, (err) ->
    if err
      throw err
    return
  actress

module.exports = addActress