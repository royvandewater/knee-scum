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
      description: @$('[name=description]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @collection.create @model, # Performs a PATCH if model exists
      success: =>
        Backbone.history.navigate "areas/#{@model.id}/climbs", trigger: true
