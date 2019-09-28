App.cable.subscriptions.create('RatesChannel', {
  connected: ->
    @perform 'follow'
  ,

  received: (data) ->
    rateId = document.getElementById('rate')
    rate = JSON.parse(data)
    rateId.innerHTML = rate.value
})