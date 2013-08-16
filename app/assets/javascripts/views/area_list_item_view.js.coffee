class KneeScum.AreaListItemView extends Backbone.View
  tagName: 'a'
  className: 'list-group-item'
  template: JST['templates/area_list_item']

  render: =>
    @$el.addClass('active') if @active
    @$el.attr href: @areaClimbsUrl()
    @$el.html @template model: @model.toJSON()
    @$el

  events:
    'click': 'onClick'

  onClick: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @areaClimbsUrl(), trigger: true

  setActive: =>
    @active = true
    @render()

  areaClimbsUrl: =>
    KneeScum.Paths.areaClimbs @model.get('id')
