#= require views/climb_list_item_view

class KneeScum.ClimbListView extends Backbone.View
  template: JST['templates/climb_list']

  initialize: (selected_climb: @selected_climb) =>
    @listenTo @collection, 'add', @render
    @listenTo @collection, 'remove', @render

  context: =>
    model:         @model.toJSON()
    collection:    @collection.toJSON()
    new_climb_path: @areaClimbNewPath()
    edit_area_path: @areaEditPath()

  render: =>
    @$el.html @template @context()
    @collection.each @addOne
    @$el

  events: =>
    'click .edit': 'onClickEdit'
    'click .new':  'onClickNew'

  onClickEdit: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaEditPath(), trigger: true

  onClickNew: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbNewPath(), trigger: true

  addOne: (model) =>
    view = new KneeScum.ClimbListItemView(model: model)
    view.setActive() if model == @selected_climb
    @$('.list-group').append view.render()

  areaEditPath: =>
    KneeScum.Paths.areaEdit @model.get('id')

  areaClimbNewPath: =>
    KneeScum.Paths.areaClimbNew @model.get('id')
