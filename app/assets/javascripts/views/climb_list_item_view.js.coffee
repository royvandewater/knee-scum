class KneeScum.ClimbListItemView extends Backbone.View
  tagName: 'a'
  className: 'list-group-item'
  template: JST['templates/climb_list_item']

  render: =>
    @$el.addClass('active') if @active
    @$el.attr href: @areaClimbUrl()
    @$el.html @template model: @model.toJSON()
    @$el

  events:
    'click': 'onClick'

  onClick: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbUrl(), trigger: true

  setActive: =>
    @active = true
    @render()

  areaClimbUrl: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('id')
