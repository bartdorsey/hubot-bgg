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

// all options are optional
var options = {
  timeout: 10000, // timeout of 10s (5s is the default)

  // see https://github.com/cujojs/rest/blob/master/docs/interceptors.md#module-rest/interceptor/retry
  retry: {
    initial: 100,
    multiplier: 2,
    max: 15e3
  }
}

var bgg = require('bgg')(options);

module.exports = (robot) ->
  robot.respond /bgg search (.*)/, (msg) ->
    bgg('search', { query: ""})
      .then (results) -> 
        msg.reply "hello!"
        console.log(results)
