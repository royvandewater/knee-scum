class KneeScum.PhotoGridView extends Backbone.View
  template: JST['templates/photo_grid']

  render: =>
    @$el.html @template 
      new_photo_path: "##{@collection.url}/new"
      collection:     @collection.toJSON()
    @$el
