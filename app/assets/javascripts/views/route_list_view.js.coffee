class KneeScum.RouteListView extends Backbone.View
  className: 'col-lg-4'
  template: JST['templates/route_list']

  initialize: =>
    @listenTo @collection, 'add', @addOne

  render: =>
    @$el.html @template collection: @collection.toJSON()
    @collection.each @addOne
    @$el

  addOne: (model) =>
    @$('ul').append new KneeScum.RouteListItemView(model: model).render()
