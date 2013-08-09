class KneeScum.Climb extends Backbone.Model
  initialize: =>
    @photos = new KneeScum.Photos
    @on 'change:id', @update_photos_url
    @update_photos_url()

  update_photos_url: =>
    return unless @id
    @photos.url = "#{@url()}/photos"
    window.c = this
