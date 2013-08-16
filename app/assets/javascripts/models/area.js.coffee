class KneeScum.Area extends Backbone.Model
  initialize: (options={}) =>
    @climbs = new KneeScum.Climbs options.climbs
    @on 'change:climbs_url', @update_climbs_url
    @update_climbs_url()

  update_climbs_url: =>
    @climbs.url = @get 'climbs_url'
