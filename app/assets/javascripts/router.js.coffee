class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Routes()
    @collection.fetch()

  routes:
    '':    'routes_list'
    'new': 'new_route'

  routes_list: =>
    @two_panel
      left:  new KneeScum.RouteListView collection: @collection

  new_route: =>
    @two_panel
      left:  new KneeScum.RouteListView collection: @collection
      right: new KneeScum.RouteFormView collection: @collection

  two_panel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
