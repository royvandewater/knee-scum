#= require views/climb_list_item_view

class KneeScum.ClimbListView extends Backbone.View
  template: JST['templates/climb_list']

  initialize: (selected_climb: @selected_climb) =>
    @listenTo @collection, 'add', @render
    @listenTo @collection, 'remove', @render

  context: =>
    model:         @model.toJSON()
    collection:    @collection.toJSON()
    new_climb_url: @areaClimbNewUrl()

  render: =>
    @$el.html @template @context()
    @collection.each @addOne
    @$el

  events: =>
    'click .new': 'onClickNew'

  onClickNew: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbNewUrl(), trigger: true

  addOne: (model) =>
    view = new KneeScum.ClimbListItemView(model: model)
    view.setActive() if model == @selected_climb
    @$('.list-group').append view.render()

  areaClimbNewUrl: =>
    KneeScum.Paths.areaClimbNew @model.get('id')
