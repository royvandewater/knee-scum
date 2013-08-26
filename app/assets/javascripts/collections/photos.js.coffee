#= require models/photo

class KneeScum.Photos extends Backbone.Collection
  model: KneeScum.Photo

  after: (photo) =>
    @at ((@indexOf(photo) + 1) % @size())

  before: (photo) =>
    @at ((@indexOf(photo) + (@size() - 1)) % @size())

  build: =>
    model = new @model
    model.urlRoot = @url
    @listenToOnce model, 'sync', (model) =>
      @add model
    model
