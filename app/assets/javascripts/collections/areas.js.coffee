#= require models/area

class KneeScum.Areas extends Backbone.Collection
  model: KneeScum.Area
  url: '/areas'

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
