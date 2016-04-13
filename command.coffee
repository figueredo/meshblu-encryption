_ = require 'lodash'
Encryption = require '.'

getFromCommands = ->
  _.chain(Encryption)
    .keys()
    .filter (key) => _.startsWith key, 'from'
    .map (command) => _.kebabCase _.trimLeft command, 'from'
    .value()

getToCommands = ->
  _.chain(Encryption.prototype)
    .keys()
    .filter (key) => _.startsWith key, 'to'
    .map (command) => _.kebabCase _.trimLeft command, 'to'
    .value()


console.log getFromCommands()
console.log getToCommands()
console.log process.argv