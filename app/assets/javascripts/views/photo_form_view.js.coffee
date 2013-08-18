class KneeScum.PhotoFormView extends Backbone.View
  template: JST['templates/photo_form']

  initialize: (climb: @climb) =>
    @model ?= @collection.build()

  context: =>
    model:           @model.toJSON()
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
        @model.set data
        @collection.add @model
        @close()

  close: =>
    Backbone.history.navigate @areaClimbPath(), trigger: true

  areaClimbPath: =>
    KneeScum.Paths.areaClimb @climb.get('area_id'), @climb.get('id')
