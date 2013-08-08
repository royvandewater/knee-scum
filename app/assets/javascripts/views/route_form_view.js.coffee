class KneeScum.RouteFormView extends Backbone.View
  template: JST['templates/route_form']

  events:
    'change': 'onChange'
    'submit': 'onSubmit'

  render: =>
    @$el.html @template model: @model.toJSON(), cid: @cid
    @$el

  onChange: ($event) =>
    @model.set
      name:       @$('[name=name]').val()
      difficulty: @$('[name=difficulty]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @collection.create @model, 
      success: => 
        Backbone.history.navigate '', trigger: true
