class KneeScum.ClimbListItemView extends Backbone.View
  tagName: 'a'
  className: 'list-group-item'
  template: JST['templates/climb_list_item']

  render: =>
    @$el.addClass('active') if @active
    @$el.attr href: "#climbs/#{@model.id}"
    @$el.html @template model: @model.toJSON()
    @$el

  setActive: =>
    @active = true
    @render()
