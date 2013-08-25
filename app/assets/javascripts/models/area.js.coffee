class KneeScum.Area extends Backbone.Model
  initialize: (options={}) =>
    @climbs = new KneeScum.Climbs options.climbs
    @on 'change:climbs_url', @updateClimbsUrl
    @on 'error', @updateValidationError
    @updateClimbsUrl()

  validate: (attributes, options={}) =>
    errors = {}
    errors.name = ["Can't be blank"] unless attributes.name?.length > 0
    errors unless _(errors).isEmpty() # only return

  updateClimbsUrl: =>
    @climbs.url = @get 'climbs_url'

  updateValidationError: (model, xhr, options) =>
    return unless xhr.status == 422
    @validationError = xhr.responseJSON.errors
    @trigger 'invalid', this, @validationError
