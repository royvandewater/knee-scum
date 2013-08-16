class KneeScum.Area extends Backbone.Model
  initialize: (options={}) =>
    @climbs = new KneeScum.Climbs options.climbs
    @climbs.url = @get 'climbs_url'
