class KneeScum.AreaView extends Backbone.View
  template: JST['templates/area']

  context: =>
    model: @model.toJSON()

  render: =>
    @$el.html @template @context()
    @$el

