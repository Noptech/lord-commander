
module.exports = (robot) ->
  NightMare = require 'nightmare'
  nightmare = NightMare({ show: true})

  robot.hear /skrald/i, (res) ->
    console.log 'triggered skrald script'
    url = ''
    nightmare
    .goto(url)
    .wait('.span5')
    .evaluate(() ->
      return document.querySelector('.span5').textContent
    )
    .end()
    .then((result) ->
      console.log result
      res.reply result
    )
    .catch((error) ->
      console.error error
      res.reply 'ups.. that didn\'t go well, try again later'
    )
