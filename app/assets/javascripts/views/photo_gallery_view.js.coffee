class KneeScum.PhotoGalleryView extends Backbone.View
  template: JST['templates/photo_gallery']
  modalClass: 'extra-wide' # Used by two_panel_view
  fillScreen: true

  context: =>
    model:               @model.toJSON()
    close_gallery_path:  @areaClimbPath()
    previous_photo_path: @previousPhotoPath()
    next_photo_path:     @nextPhotoPath()

  render: =>
    @$el.html @template @context()
    $(document).off('keydown').on 'keydown', @onKeypress
    @$('img.main-photo').load => @trigger 'change'
    @trigger 'change'
    @$el

  events:
    'click .close':      'onClickClose'
    'click .previous a': 'onClickPrevious'
    'click .next a':     'onClickNext'

  onClickClose: ($event) =>
    $event.preventDefault()
    @trigger 'closeme'

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
        @trigger 'closeme'
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
    Backbone.history.navigate @areaClimbPath(), trigger: true

  areaClimbPath: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('climb_id')

  nextPhoto: =>
    @collection.after @model

  nextPhotoPath: =>
    nextPhotoId = @nextPhoto().id
    KneeScum.Paths.areaClimbPhotoGallery @model.get('area_id'), @model.get('climb_id'), nextPhotoId

  previousPhoto: =>
    @collection.before @model

  previousPhotoPath: =>
    previousPhotoId = @previousPhoto().id
    KneeScum.Paths.areaClimbPhotoGallery @model.get('area_id'), @model.get('climb_id'), previousPhotoId
