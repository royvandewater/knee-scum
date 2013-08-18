class KneeScum.NavbarView extends Backbone.View
  template: JST['templates/navbar']

  context: =>
    root_path: @root_path()

  render: =>
    @$el.html @template @context()

  events:
    'click .navbar-brand': 'onClickBrand'

  onClickBrand: ($event) =>
    $event.preventDefault()
    Backbone.history.navigate @root_path(), trigger: true

  root_path: =>
    KneeScum.Paths.root()
