class KneeScum.PhotoThumbnailView extends Backbone.View
  template: JST['templates/photo_thumbnail']
  className: 'col-lg-3'

  context: =>
    model: @model.toJSON()
    photo_gallery_url: @photoGalleryUrl()

  render: =>
    @$el.html @template @context()
    @$el

  events:
    'click .thumbnail': 'onClickThumbnail'

  onClickThumbnail: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @photoGalleryUrl(), trigger: true


  photoGalleryUrl: =>
    KneeScum.Paths.areaClimbPhotoGallery @model.get('area_id'), @model.get('climb_id'), @model.get('id')
