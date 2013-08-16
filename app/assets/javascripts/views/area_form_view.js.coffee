class KneeScum.AreaFormView extends Backbone.View
  template: JST['templates/area_form']

  initialize: =>
    @model ?= @collection.build()

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
    @model.save {},
      success: (data) =>
        @collection.add @model
        Backbone.history.navigate KneeScum.Paths.areaClimbs(@model.id), trigger: true
