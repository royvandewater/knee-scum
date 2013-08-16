class KneeScum.ClimbFormView extends Backbone.View
  template: JST['templates/climb_form']

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
      difficulty:  @$('[name=difficulty]').val()
      description: @$('[name=description]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @collection.create @model, # Performs a PATCH if model exists
      success: =>
        console.log @model.toJSON()
        Backbone.history.navigate @areaClimbUrl(), trigger: true

  areaClimbUrl: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('id')
