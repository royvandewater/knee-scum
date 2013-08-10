class KneeScum.ClimbListView extends Backbone.View
  template: JST['templates/climb_list']

  initialize: =>
    @listenTo @collection, 'add', @render
    @listenTo @collection, 'remove', @render

  render: =>
    @$el.html @template collection: @collection.toJSON()
    @collection.each @addOne
    @$el

  addOne: (model) =>
    view = new KneeScum.ClimbListItemView(model: model)
    view.setActive() if model == @model
    @$('.list-group').append view.render()
