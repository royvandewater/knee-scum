class KneeScum.PhotoGridView extends Backbone.View
  template: JST['templates/photo_grid']

  initialize: =>
    @listenTo @collection, 'add', @addOne

  render: =>
    @$el.html @template new_photo_path: "##{@collection.url}/new"
    @collection.each @addOne
    @$el

  addOne: (model) =>
    view = new KneeScum.PhotoThumbnailView model: model
    @$('.gallery').append view.render()
