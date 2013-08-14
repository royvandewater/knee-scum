class KneeScum.Router extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Climbs()
    @collection.fetch()

  routes:
    'climbs/:climb_id/photos/new': 'newClimbPhoto'
    'climbs/:climb_id/photos/:id': 'climbPhoto'
    'climbs/new':                  'newClimb'
    'climbs/:id/edit':             'editClimb'
    'climbs/:id/photos':           'climb'
    'climbs/:id':                  'climb'
    'climbs':                      'climbs'
    'areas':                       'areas'
    '':                            'climbs'

  climbs: =>
    @twoPanel
      left:  new KneeScum.ClimbListView collection: @collection

  newClimb: =>
    @twoPanel
      left:  new KneeScum.ClimbListView collection: @collection
      right: new KneeScum.ClimbFormView collection: @collection

  climb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbView     model: model

  editClimb: (id) =>
    @collection.whenFetched =>
      model = @collection.get id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbFormView model: model, collection: @collection

  climbPhoto: (climb_id, photo_id) =>
    @collection.whenFetched =>
      model = @collection.get climb_id
      photos = model.photos
      photo  = photos.get photo_id

      @twoPanel
        left:  new KneeScum.ClimbListView    model: model, collection: @collection
        right: new KneeScum.ClimbView        model: model
        modal: new KneeScum.PhotoGalleryView model: photo, collection: photos

  newClimbPhoto: (climb_id) =>
    @collection.whenFetched =>
      model = @collection.get climb_id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @collection
        right: new KneeScum.ClimbView     model: model
        modal: new KneeScum.PhotoFormView collection: model.photos

  twoPanel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
    @view.show_modal()
