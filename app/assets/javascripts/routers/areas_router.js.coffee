class KneeScum.AreasRouter extends Backbone.Router
  initialize: =>
    @collection = new KneeScum.Areas()
    @collection.fetch()
    @navbarView = new KneeScum.NavbarView()
    $('.navbar').html @navbarView.render()
    @on 'route', =>
      window.admin = true if url '?admin'


  routes:
    'areas/:area_id/climbs/:climb_id/photos/new': 'areaClimbPhotoNew'
    'areas/:area_id/climbs/new':                  'areaClimbNew'
    'areas/:area_id/climbs/:climb_id/photos/:id': 'areaClimbPhoto'
    'areas/:area_id/climbs/:id/edit':             'areaClimbEdit'
    'areas/:area_id/climbs/:id':                  'areaClimb'
    'areas/:area_id/climbs':                      'areaClimbs'
    'areas/:area_id/edit':                        'areaEdit'
    'areas/new':                                  'areaNew'
    'areas':                                      'areas'
    '':                                           'areas'

  areas: =>
    @twoPanel
      left: new KneeScum.AreaListView collection: @collection

  areaNew: =>
    @twoPanel
      left:  new KneeScum.AreaListView collection: @collection
      right: new KneeScum.AreaFormView collection: @collection

  areaEdit: (areaId) =>
    @collection.whenFetched =>
      area = @collection.get areaId
      @twoPanel
        left:  new KneeScum.AreaListView collection: @collection, selected_area: area
        right: new KneeScum.AreaFormView collection: @collection, model: area

  areaClimbs: (areaId) =>
    @collection.whenFetched =>
      area   = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      @twoPanel
        left:  new KneeScum.ClimbListView collection: climbs, model: area
        right: new KneeScum.AreaView model: area

  areaClimbNew: (areaId) =>
    @collection.whenFetched =>
      area = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      @twoPanel
        left:  new KneeScum.ClimbListView model: area, collection: climbs
        right: new KneeScum.ClimbFormView collection: climbs

  areaClimb: (areaId, climbId) =>
    @collection.whenFetched =>
      area = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area, collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbView     model: climb

  areaClimbEdit: (areaId, climbId) =>
    @collection.whenFetched =>
      area = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area,  collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbFormView model: climb, collection: climbs

  areaClimbPhotoNew: (areaId, climbId) =>
    @collection.whenFetched =>
      area   = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area, collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbView     model: climb
          modal: new KneeScum.PhotoFormView collection: climb.photos, climb: climb

  areaClimbPhoto: (areaId, climbId, photoId) =>
    @collection.whenFetched =>
      area   = @collection.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb  = climbs.get climbId
        photos = climb.photos
        photo  = photos.get photoId

        @twoPanel
          left:  new KneeScum.ClimbListView    model: area, collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbView        model: climb
          modal: new KneeScum.PhotoGalleryView model: photo, collection: photos

  twoPanel: (options={}) =>
    @view?.remove()
    @view = new KneeScum.TwoPanelView options
    $('#main-content').html @view.render()
    @view.scrollTo()
    @view.show_modal()
