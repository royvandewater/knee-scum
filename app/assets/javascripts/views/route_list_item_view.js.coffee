class KneeScum.RouteListItemView extends Backbone.View
  tagName: 'li'
  className: 'list-group-item'
  template: JST['templates/route_list_item']

  render: =>
    @$el.html @template model: @model.toJSON()
    @$el
