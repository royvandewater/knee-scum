class KneeScum.Router extends Backbone.Router
  initialize: =>
    @areas = new KneeScum.Areas()
    @areas.fetch()
    @climbs = new KneeScum.Climbs()
    @climbs.fetch()

  routes:
    'climbs/:climb_id/photos/new': 'newClimbPhoto'
    'climbs/:climb_id/photos/:id': 'climbPhoto'
    'climbs/new':                  'newClimb'
    'climbs/:id/edit':             'editClimb'
    'climbs/:id/photos':           'climb'
    'climbs/:id':                  'climb'
    'climbs':                      'climbs'
    'areas/new':                   'newArea'
    'areas':                       'areas'
    '':                            'climbs'

  areas: =>
    @twoPanel
      left: new KneeScum.AreaListView collection: @areas

  newArea: =>
    @twoPanel
      left:  new KneeScum.AreaListView collection: @areas
      right: new KneeScum.AreaFormView collection: @areas

  climbs: =>
    @twoPanel
      left:  new KneeScum.ClimbListView collection: @climbs

  newClimb: =>
    @twoPanel
      left:  new KneeScum.ClimbListView collection: @climbs
      right: new KneeScum.ClimbFormView collection: @climbs

  climb: (id) =>
    @climbs.whenFetched =>
      model = @climbs.get id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @climbs
        right: new KneeScum.ClimbView     model: model

  editClimb: (id) =>
    @climbs.whenFetched =>
      model = @climbs.get id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @climbs
        right: new KneeScum.ClimbFormView model: model, collection: @climbs

  climbPhoto: (climb_id, photo_id) =>
    @climbs.whenFetched =>
      model = @climbs.get climb_id
      photos = model.photos
      photo  = photos.get photo_id

      @twoPanel
        left:  new KneeScum.ClimbListView    model: model, collection: @climbs
        right: new KneeScum.ClimbView        model: model
        modal: new KneeScum.PhotoGalleryView model: photo, collection: photos

  newClimbPhoto: (climb_id) =>
    @climbs.whenFetched =>
      model = @climbs.get climb_id
      @twoPanel
        left:  new KneeScum.ClimbListView model: model, collection: @climbs
        right: new KneeScum.ClimbView     model: model
        modal: new KneeScum.PhotoFormView collection: model.photos

  twoPanel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
    @view.show_modal()
