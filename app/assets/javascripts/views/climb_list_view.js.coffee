class KneeScum.ClimbListView extends Backbone.View
  template: JST['templates/climb_list']

  initialize: =>
    @listenTo @collection, 'add', @addOne

  render: =>
    @$el.html @template collection: @collection.toJSON()
    @collection.each @addOne
    @$el

  addOne: (model) =>
    @$('.list-group').append new KneeScum.ClimbListItemView(model: model).render()
