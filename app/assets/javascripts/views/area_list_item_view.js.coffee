class KneeScum.AreaListItemView extends Backbone.View
  tagName: 'a'
  className: 'list-group-item'
  template: JST['templates/area_list_item']

  render: =>
    @$el.addClass('active') if @active
    @$el.attr href: "#areas/#{@model.id}"
    @$el.html @template model: @model.toJSON()
    @$el

  setActive: =>
    @active = true
    @render()
