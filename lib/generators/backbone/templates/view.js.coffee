class window.<%= class_name %>View extends Backbone.View
  template: JST['templates/<%= file_name %>']

  context: =>
    {}

  render: =>
    @$el.html @template @context()
