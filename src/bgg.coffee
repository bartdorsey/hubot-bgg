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

bgg = require('bgg')

module.exports = (robot) ->
  robot.respond /bgg search (.*)/, (msg) ->
    bgg('search', { query: ""})
      .then (results) -> 
        msg.reply "hello!"
        console.log(results)
