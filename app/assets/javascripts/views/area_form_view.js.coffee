class KneeScum.AreaFormView extends Backbone.View
  template: JST['templates/area_form']

  initialize: =>
    @model ?= @collection.build()
    @listenTo @model, 'invalid', @render
    @listenToOnce @model, 'destroy', @navigateToAreas
    @listenToOnce @model, 'sync',    @navigateToArea

  context: =>
    cid:    @cid
    model:  @model.toJSON()
    errors: @model.validationError

  render: =>
    @$el.html @template @context()
    @$el

  remove: =>
    super

  events:
    'click .delete': 'onClickDelete'
    'submit':        'onSubmit'

  onClickDelete: ($event) =>
    $event.preventDefault()
    if confirm 'Are you sure?'
      @stopListening @model, 'sync'
      @model.destroy()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @model.save @formData()

  formData: =>
    name: @$('[name=name]').val()

  navigateToArea: =>
    Backbone.history.navigate KneeScum.Paths.areaClimbs(@model.id), trigger: true

  navigateToAreas: =>
    Backbone.history.navigate KneeScum.Paths.areas(), trigger: true
