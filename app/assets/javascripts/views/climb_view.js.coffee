class KneeScum.ClimbView extends Backbone.View
  template: JST['templates/climb']

  events:
    'click .delete' : 'delete'

  render: =>
    @$el.html @template model: @model?.toJSON()

    photo_grid_view = new KneeScum.PhotoGridView collection: @model.photos
    @$('.photos-container').html photo_grid_view.render()

    @$el

  delete: =>
    if confirm 'Are you sure?'
      @model.destroy
        success: =>
          Backbone.history.navigate '', trigger: true
