class KneeScum.Climb extends Backbone.Model
  initialize: =>
    @photos = new KneeScum.Photos @get 'photos'
    @on 'change:id', @update_photos_url
    @on 'change:photos', @update_photos
    @update_photos_url()

  update_photos: =>
    @photos.add @get 'photos'

  update_photos_url: =>
    return unless @id
    @photos.url = "#{@url()}/photos"
    window.c = this

