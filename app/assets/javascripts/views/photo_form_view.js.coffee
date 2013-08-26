class KneeScum.PhotoFormView extends Backbone.View
  template: JST['templates/photo_form']

  initialize: (climb: @climb) =>
    @model ?= @collection.build()
    @listenTo @model, 'invalid', @render
    @listenToOnce @model, 'sync', @close

  context: =>
    model:           @model.toJSON()
    errors:          @model.validationError
    close_form_path: @areaClimbPath()

  render: =>
    @$el.html @template @context()
    @$el

  events:
    'click .close': 'onClickClose'
    'change':       'onChange'
    'submit':       'onSubmit'

  onClickClose: ($event) =>
    $event.preventDefault()
    @close()

  onChange: =>
    @model.set
      title:       @$('[name=title]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $.ajax "#{@collection.url}.json",
      headers:
        Accept: 'text/plain'
      type:     'POST'
      data:
        @model.toJSON()
      files:    @$('[name=file]')
      iframe:   true
      dataType: 'json'
      processData: false
      success: (data) =>
        @model.save data

  close: =>
    Backbone.history.navigate @areaClimbPath(), trigger: true

  areaClimbPath: =>
    KneeScum.Paths.areaClimb @climb.get('area_id'), @climb.get('id')
