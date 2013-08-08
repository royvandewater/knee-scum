class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Climbs()
    @collection.fetch()

  routes:
    'climbs':     'climbs_list'
    'climbs/new': 'new_climb'
    'climbs/:id': 'climb_show'
    '':           'climbs_list'

  climbs_list: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection

  new_climb: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection
      right: new KneeScum.ClimbFormView collection: @collection

  climb: =>

  two_panel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
