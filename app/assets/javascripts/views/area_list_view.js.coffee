#= require views/area_list_item_view

class KneeScum.AreaListView extends Backbone.View
  template: JST['templates/area_list']

  initialize: =>
    @listenTo @collection, 'add', @render
    @listenTo @collection, 'remove', @render

  render: =>
    @$el.html @template collection: @collection.toJSON()
    @collection.each @addOne
    @$el

  addOne: (model) =>
    view = new KneeScum.AreaListItemView(model: model)
    view.setActive() if model == @model
    @$('.list-group').append view.render()
