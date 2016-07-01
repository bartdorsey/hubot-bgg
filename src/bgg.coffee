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
  robot.respond /bgg search (.*)$/, (msg) ->
    query = msg.match[1].replace(/\s+/g, '+')
    params = 
      query: query
      type: 'boardgame'
    console.log params
    bgg('search', params)
      .then (results) -> 
        console.log results
        if results.items.total > 0
          if results.items.total is 1
            items = [items]
          items = results.items.item.slice(0,4)
          for item in items
            do (item) -> 
              msg.send "http://www.boardgamegeek.com/#{item.type}/#{item.id}"
        else
          msg.send "We couldn't find any boardgames matching \"#{msg.match[1]}\""
        