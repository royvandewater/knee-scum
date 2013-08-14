class KneeScum.PhotoGalleryView extends Backbone.View
  template: JST['templates/photo_gallery']
  modalClass: 'extra-wide' # Used by two_panel_view
  fillScreen: true

  context: =>
    model:               @model.toJSON()
    close_gallery_path:  @closePath()
    previous_photo_path: @previousPhotoPath()
    next_photo_path:     @nextPhotoPath()

  render: =>
    @$el.html @template @context()
    $(document).off('keydown').on 'keydown', @onKeypress
    @trigger 'change'
    @$el

  events:
    'click .previous a': 'onClickPrevious'
    'click .next a':     'onClickNext'

  onClickPrevious: ($event) =>
    $event.preventDefault()
    @showPrevious()

  onClickNext: ($event) =>
    $event.preventDefault()
    @showNext()

  onKeypress: ($event) =>
    switch $event.which
      when 27 # Escape
        $event.preventDefault()
        @close()
      when 37 # Left Arrow
        $event.preventDefault()
        @showPrevious()
      when 39 # Right Arrow
        $event.preventDefault()
        @showNext()

  showPrevious: =>
    Backbone.history.navigate @previousPhotoPath()
    @model = @previousPhoto()
    @render()

  showNext: =>
    Backbone.history.navigate @nextPhotoPath()
    @model = @nextPhoto()
    @render()

  close: =>
    Backbone.history.navigate @closePath(), trigger: true

  closePath: =>
    "#{@collection.url}"

  nextPhoto: =>
    @collection.after @model

  nextPhotoPath: =>
    nextPhotoId = @nextPhoto().id
    "#{@collection.url}/#{nextPhotoId}"

  previousPhoto: =>
    @collection.before @model

  previousPhotoPath: =>
    previousPhotoId = @previousPhoto().id
    "#{@collection.url}/#{previousPhotoId}"
