_ = require 'lodash'
dashdash = require 'dashdash'
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


console.log dashdash
console.log getFromCommands()
console.log getToCommands()
args = _.clone process.argv
value = args.pop()
to = args.pop()
from = args.pop()
console.log {value, from, to}
