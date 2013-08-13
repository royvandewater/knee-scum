class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Climbs()
    @collection.fetch()

  routes:
    'climbs/:climb_id/photos/new': 'new_climb_photo'
    'climbs/:climb_id/photos/:id': 'climb_photo'
    'climbs/new':                  'new_climb'
    'climbs/:id/edit':             'edit_climb'
    'climbs/:id/photos':           'climb'
    'climbs/:id':                  'climb'
    'climbs':                      'climbs'
    '':                            'climbs'

  new_climb: =>
    @collection.each this.addClimb

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

  edit_climb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @two_panel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbFormView model: model, collection: @collection

  climb_photo: (climb_id, photo_id) =>
    @collection.whenFetched =>
      model = @collection.get climb_id
      photos = model.photos
      photo  = photos.get photo_id

      @two_panel
        left:  new KneeScum.ClimbListView    model: model, collection: @collection
        right: new KneeScum.ClimbView        model: model
        modal: new KneeScum.PhotoGalleryView model: photo, collection: photos

  new_climb_photo: (climb_id) =>
    @collection.whenFetched =>
      model = @collection.get climb_id
      @two_panel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbView     model: model
        modal: new KneeScum.PhotoFormView collection: model.photos

  two_panel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
    @view.show_modal()
