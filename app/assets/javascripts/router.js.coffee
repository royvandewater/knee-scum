class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Climbs()
    @collection.fetch()

  routes:
    'climbs':     'climbs'
    'climbs/new': 'new_climb'
    'climbs/:id': 'climb'
    '':           'climbs'

  climbs: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection

  new_climb: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection
      right: new KneeScum.ClimbFormView collection: @collection

  climb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @two_panel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbView     model: model

  two_panel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
