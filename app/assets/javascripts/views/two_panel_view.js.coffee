class KneeScum.TwoPanelView extends Backbone.View
  template: JST['templates/two_panel']

  initialize: (left: @left, right: @right) =>

  render: =>
    @$el.html @template()
    @$('.left-panel ').html  @left?.render()
    @$('.right-panel').html @right?.render()
    @$el
