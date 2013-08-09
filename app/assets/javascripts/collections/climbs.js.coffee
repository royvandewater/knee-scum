#= require models/climb

class KneeScum.Climbs extends Backbone.Collection
  model: KneeScum.Climb
  url: '/climbs'

  initialize: =>
    if @size() > 0
      @fetched = true
    else
      @on 'add', =>
        @fetched = true
        @trigger 'fetched'

  whenFetched: (cb=->) =>
    if @fetched
      cb() 
    else
      @once 'fetched', cb
