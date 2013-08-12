class KneeScum.PhotoThumbnailView extends Backbone.View
  template: JST['templates/photo_thumbnail']
  className: 'col-lg-3'

  render: =>
    @$el.html @template 
      photo_path: "##{@model.url()}"
      model: @model.toJSON()
    @$el
