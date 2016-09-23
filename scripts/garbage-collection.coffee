
module.exports = (robot) ->
  NightMare = require 'nightmare'
  nightmare = NightMare({ show: false})

  robot.hear /skrald/i, (msg) ->
    url = robot.brain.get('garbageUrl')
    if url
      msg.reply "let me see.."
      nightmare
      .goto(url)
      .wait('.span5')
      .evaluate(() ->
        return document.querySelector('.span5').textContent
      )
      .end()
      .then((result) ->
        console.log result
        msg.reply result
      )
      .catch((error) ->
        console.error error
        msg.reply "ups.. that didn\'t go well, try again later"
      )
    else
      msg.reply "no garbage url set. Admin can set this with 'set garbageurl http://...'"

  robot.hear /@?(set garbageurl) (http(.+))/i, (msg) ->
    if !robot.Auth.hasRole(msg.message.user.name, 'root')
      msg.reply "only admin can set garbage url"
    else
      garbageUrl = msg.match[2].trim()
      robot.brain.set('garbageUrl', garbageUrl)
      msg.reply "garbage url set, get the next collection date by typing 'skrald'"
