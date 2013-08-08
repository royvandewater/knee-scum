class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Routes
    @collection.fetch()

  routes:
    '':    'routes_path'
    'new': 'new_route_path'

  routes_path: =>
    @right_panel?.remove()
    @left_panel = new KneeScum.RouteListView collection: @collection

    $('#left-panel').html @left_panel.render()

  new_route_path: =>
    @routes_path()
    model = new KneeScum.Route
    @right_panel = new KneeScum.RouteFormView model: model, collection: @collection
    $('#right-panel').html @right_panel.render()
