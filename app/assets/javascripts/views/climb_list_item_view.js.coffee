class KneeScum.ClimbListItemView extends Backbone.View
  tagName: 'a'
  className: 'list-group-item'
  template: JST['templates/climb_list_item']

  render: =>
    @$el.attr href: "#climbs/#{@model.id}"
    @$el.html @template model: @model.toJSON()
    @$el
