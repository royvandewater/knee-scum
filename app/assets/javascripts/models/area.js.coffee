class KneeScum.Area extends Backbone.Model

  initialize: (options={}) =>
    @climbs = new KneeScum.Climbs options.climbs
    @on 'change:climbs_url', @update_climbs_url
    @update_climbs_url()

  validate: (attributes, options={}) =>
    errors = {}
    errors.name = 'Cannot be blank' unless attributes.name?.length > 0
    errors unless _(errors).isEmpty() # only return

  update_climbs_url: =>
    @climbs.url = @get 'climbs_url'
