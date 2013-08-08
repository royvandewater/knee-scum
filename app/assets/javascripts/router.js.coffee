class KneeScum.Router extends Backbone.Router
  routes:
    '':   'routes_path'

  routes_path: ->
    @collection = new KneeScum.Routes
    @view       = new KneeScum.RouteListView collection: @collection

    $('#main-content').html @view.render()
    @collection.fetch()
    
