class KneeScum.PhotoThumbnailView extends Backbone.View
  template: JST['templates/photo_thumbnail']
  className: 'col-lg-3 thumbnail-container'

  context: =>
    model: @model.toJSON()
    photo_gallery_path: @photoGalleryPath()

  render: =>
    @$el.html @template @context()
    @$el

  events:
    'click a': 'onClickThumbnail'

  onClickThumbnail: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @photoGalleryPath(), trigger: true


  photoGalleryPath: =>
    KneeScum.Paths.areaClimbPhotoGallery @model.get('area_id'), @model.get('climb_id'), @model.get('id')
