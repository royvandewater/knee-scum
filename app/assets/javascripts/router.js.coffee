class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Climbs()
    @collection.fetch()

  routes:
    'climbs/:climb_id/photos/new': 'new_climb_photo'
    'climbs/new':                  'new_climb'
    'climbs/:id/edit':             'edit_climb'
    'climbs/:id/photos':           'climb'
    'climbs/:id':                  'climb'
    'climbs':                      'climbs'
    '':                            'climbs'

  climbs: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection

  new_climb: =>
    @two_panel
      left:  new KneeScum.ClimbListView collection: @collection
      right: new KneeScum.ClimbFormView collection: @collection

  edit_climb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @two_panel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbFormView model: model, collection: @collection

  climb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @two_panel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbView     model: model

  new_climb_photo: (climb_id) =>
    @climb(climb_id)
    @collection.whenFetched =>
      photos = @collection.get(climb_id).photos
      view   = new KneeScum.PhotoFormView collection: photos
      $('#modal-content').html view.render()
      view.show()

  modal: (options={}) =>
    @modal_view?.remove()
    @modal_view = new KneeScum.ModalView options
    $('#modal-content').html @modal_view.render()
    @modal_view.show()

  two_panel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
