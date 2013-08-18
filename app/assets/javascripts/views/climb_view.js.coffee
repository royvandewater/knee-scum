class KneeScum.ClimbView extends Backbone.View
  template: JST['templates/climb']

  events:
    'click .edit'   : 'onClickEdit'

  context: =>
    model: @model.toJSON()
    edit_url: @areaClimbsEditUrl()

  render: =>
    @$el.html @template @context()

    photo_grid_view = new KneeScum.PhotoGridView model: @model, collection: @model.photos
    @$('.photos-container').html photo_grid_view.render()

    @$el

  onClickEdit: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbsEditUrl(), trigger: true

  areaClimbsEditUrl: =>
    KneeScum.Paths.areaClimbEdit @model.get('area_id'), @model.get('id')
