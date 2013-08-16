class KneeScum.ClimbView extends Backbone.View
  template: JST['templates/climb']

  events:
    'click .delete' : 'onClickDelete'
    'click .edit'   : 'onClickEdit'

  context: =>
    model: @model.toJSON()
    edit_url: @areaClimbsEditUrl()

  render: =>
    @$el.html @template @context()

    photo_grid_view = new KneeScum.PhotoGridView model: @model, collection: @model.photos
    @$('.photos-container').html photo_grid_view.render()

    @$el

  onClickDelete: =>
    if confirm 'Are you sure?'
      @model.destroy
        success: =>
          Backbone.history.navigate @areaClimbsUrl(), trigger: true

  onClickEdit: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbsEditUrl(), trigger: true

  areaClimbsEditUrl: =>
    KneeScum.Paths.areaClimbEdit @model.get('area_id'), @model.get('id')

  areaClimbsUrl: =>
    KneeScum.Paths.areaClimbs @model.get('area_id')
