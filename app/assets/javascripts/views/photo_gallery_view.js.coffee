class KneeScum.PhotoGalleryView extends Backbone.View
  template: JST['templates/photo_gallery']

  modalClass: 'extra-wide' # Used by two_panel_view

  render: =>
    @$el.html @template
      model: @model.toJSON()
      close_gallery_path: @closePath()
      previous_photo_path: @previousPhotoPath()
      next_photo_path: @nextPhotoPath()
    $(document).off('keydown').on 'keydown', @onKeypress
    @$el

  onKeypress: ($event) =>
    switch $event.which
      when 27 # Escape
        $event.preventDefault()
        @close()
      when 37 # Left Arrow
        $event.preventDefault()
        Backbone.history.navigate @previousPhotoPath(), trigger: true
      when 39 # Right Arrow
        $event.preventDefault()
        Backbone.history.navigate @nextPhotoPath(), trigger: true

  close: =>
    Backbone.history.navigate @closePath(), trigger: true

  closePath: =>
    "##{@collection.url}"

  nextPhotoPath: =>
    index = (@collection.indexOf(@model) + 1) % @collection.size()
    nextPhotoId = @collection.at(index).id
    "##{@collection.url}/#{nextPhotoId}"

  previousPhotoPath: =>
    index = (@collection.indexOf(@model) + (@collection.size() - 1)) % @collection.size()
    previousPhotoId = @collection.at(index).id
    "##{@collection.url}/#{previousPhotoId}"
