# Description:
#   Allow you to find your User ID for use in Hubot-Auth
#
# Dependencies:
#   hubot-auth
#
#
# Commands:
#   !userid - Show your User ID
#
# Author:
#   Jamie Hughes


module.exports = (robot) ->

   robot.hear /!userid/i, (msg) ->
     msg.reply "Your User ID is: #{msg.message.user.id}"

