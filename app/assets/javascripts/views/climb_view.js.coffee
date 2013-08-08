class KneeScum.ClimbView extends Backbone.View
  template: JST['templates/climb']

  events:
    'click .delete' : 'delete'

  render: =>
    @$el.html @template model: @model?.toJSON()

  delete: =>
    if confirm 'Are you sure?'
      @model.destroy
        success: =>
          Backbone.history.navigate '', trigger: true
