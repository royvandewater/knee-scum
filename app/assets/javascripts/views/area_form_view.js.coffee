class KneeScum.AreaFormView extends Backbone.View
  template: JST['templates/area_form']

  initialize: =>
    @model ?= @collection.build()
    @listenTo @model, 'destroy', @navigateToAreas
    @listenTo @model, 'sync',    @navigateToArea

  context: =>
    cid:   @cid
    model: @model.toJSON()

  render: =>
    @$el.html @template model: @model.toJSON(), cid: @cid
    @$el

  events:
    'click .delete': 'onClickDelete'
    'submit':        'onSubmit'

  onClickDelete: ($event) =>
    $event.preventDefault()
    @model.destroy() if confirm 'Are you sure?'

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
