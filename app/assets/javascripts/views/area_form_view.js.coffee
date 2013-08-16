class KneeScum.AreaFormView extends Backbone.View
  template: JST['templates/area_form']

  initialize: =>
    @model ?= new @collection.model

  events:
    'change': 'onChange'
    'submit': 'onSubmit'

  render: =>
    @$el.html @template model: @model.toJSON(), cid: @cid
    @$el

  onChange: ($event) =>
    @model.set
      name:        @$('[name=name]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @collection.create @model, # Performs a PATCH if model exists
      success: (data) =>
        @model.set data
        Backbone.history.navigate KneeScum.Paths.areaClimbs(@model.id), trigger: true


