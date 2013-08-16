class KneeScum.PhotoGridView extends Backbone.View
  template: JST['templates/photo_grid']

  initialize: =>
    @listenTo @collection, 'add', @addOne

  render: =>
    @$el.html @template new_photo_path: @areaClimbPhotoNewUrl()
    @collection.each @addOne
    @$el

  events:
    'click .new': 'onClickNew'

  onClickNew: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbPhotoNewUrl(), trigger: true

  addOne: (model) =>
    view = new KneeScum.PhotoThumbnailView model: model
    @$('.gallery').append view.render()

  areaClimbPhotoNewUrl: =>
    KneeScum.Paths.areaClimbPhotoNew @model.get('area_id'), @model.get('id')
