class KneeScum.Photo extends Backbone.Model

  initialize: =>
    @on 'error', @updateValidationError

  validate: (attributes, options={}) =>
    errors = {}
    errors.title = ["Can't be blank"] unless attributes.name?.length > 0
    errors unless _(errors).isEmpty() # only return if there are errors

  updateValidationError: (model, xhr, options) =>
    return unless xhr.status == 422
    @validationError = xhr.responseJSON.errors
    @trigger 'invalid', this, @validationError

