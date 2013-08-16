#= require views/area_list_item_view

class KneeScum.AreaListView extends Backbone.View
  template: JST['templates/area_list']

  initialize: =>
    @listenTo @collection, 'add', @render
    @listenTo @collection, 'remove', @render

  context: =>
    new_area_url: @areaNewUrl()

  render: =>
    @$el.html @template @context()
    @collection.each @addOne
    @$el

  events:
    'click .new': 'onClickNew'

  onClickNew: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaNewUrl(), trigger: true

  addOne: (model) =>
    view = new KneeScum.AreaListItemView(model: model)
    @$('.list-group').append view.render()

  areaNewUrl: =>
    KneeScum.Paths.areaNew()
