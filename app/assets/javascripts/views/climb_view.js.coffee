class KneeScum.ClimbView extends Backbone.View
  template: JST['templates/climb']

  render: =>
    @$el.html @template model: @model.toJSON()
