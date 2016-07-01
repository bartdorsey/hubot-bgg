# Description
#   A hubot script to query Board Game Geek
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot hello - <what the respond trigger does>
#   orly - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Bart Dorsey[@<org>]

options = 
  timeout: 10000
  
  retry: 
    initial: 100
    multiplier: 2
    max: 15e3

bgg = require('bgg')(options)

module.exports = (robot) ->
  robot.respond /bgg search (.*)/, (msg) ->
    bgg('search', query: msg.match[1])
      .then (results) -> 
        items = results.items.item
        items = for item in items
          "<a href=\"http://www.boardgamegeek.com/#{item.type}/#{item.id}\">#{item.name.value}</a>"
        msg.reply items.join(',')