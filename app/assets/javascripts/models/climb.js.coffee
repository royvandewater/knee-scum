class KneeScum.Climb extends Backbone.Model
  initialize: =>
    @photos = new KneeScum.Photos @get 'photos'
    @on 'change:id', @updatePhotosUrl
    @on 'change:photos', @updatePhotos
    @on 'error', @updateValidationError
    @updatePhotosUrl()

  validate: (attributes, options={}) =>
    errors = {}
    errors.name       = ["Can't be blank"] unless attributes.name?.length > 0
    errors.difficulty = ["Can't be blank"] unless attributes.difficulty?.length > 0
    errors unless _(errors).isEmpty() # only return if there are errors

  updatePhotos: =>
    @photos.add @get 'photos'

  updatePhotosUrl: =>
    return unless @id
    @photos.url = "#{@url()}/photos"
    window.c = this

  updateValidationError: (model, xhr, options) =>
    return unless xhr.status == 422
    @validationError = xhr.responseJSON.errors
    @trigger 'invalid', this, @validationError

