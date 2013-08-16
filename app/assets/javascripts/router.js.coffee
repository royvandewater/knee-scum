class KneeScum.Router extends Backbone.Router
  initialize: =>
    @areas = new KneeScum.Areas()
    @areas.fetch()

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
      left: new KneeScum.AreaListView collection: @areas

  areaNew: =>
    @twoPanel
      left:  new KneeScum.AreaListView collection: @areas
      right: new KneeScum.AreaFormView collection: @areas

  areaEdit: (areaId) =>
    @areas.whenFetched =>
      area = @areas.get areaId
      @twoPanel
        left:  new KneeScum.AreaListView collection: @areas, selected_area: area
        right: new KneeScum.AreaFormView collection: @areas, model: area

  areaClimbs: (areaId) =>
    @areas.whenFetched =>
      area   = @areas.get areaId
      climbs = area.climbs
      climbs.fetch()
      @twoPanel
        left:  new KneeScum.ClimbListView collection: climbs, model: area

  areaClimbNew: (areaId) =>
    @areas.whenFetched =>
      area = @areas.get areaId
      climbs = area.climbs
      climbs.fetch()
      @twoPanel
        left:  new KneeScum.ClimbListView model: area, collection: climbs
        right: new KneeScum.ClimbFormView collection: climbs

  areaClimb: (areaId, climbId) =>
    @areas.whenFetched =>
      area = @areas.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area, collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbView     model: climb

  areaClimbEdit: (areaId, climbId) =>
    @areas.whenFetched =>
      area = @areas.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area,  collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbFormView model: climb, collection: climbs

  areaClimbPhotoNew: (areaId, climbId) =>
    @areas.whenFetched =>
      area   = @areas.get areaId
      climbs = area.climbs
      climbs.fetch()
      climbs.whenFetched =>
        climb = climbs.get climbId
        @twoPanel
          left:  new KneeScum.ClimbListView model: area, collection: climbs, selected_climb: climb
          right: new KneeScum.ClimbView     model: climb
          modal: new KneeScum.PhotoFormView collection: climb.photos, climb: climb

  areaClimbPhoto: (areaId, climbId, photoId) =>
    @areas.whenFetched =>
      area   = @areas.get areaId
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
    @view.show_modal()
