class KneeScum.PhotoFormView extends Backbone.View
  template: JST['templates/photo_form']

  initialize: =>
    @model ?= new @collection.model

  render: =>
    @$el.html @template model: @model, collection_url: "##{@collection.url}"
    @$el

  events:
    'change':       'onChange'
    'submit':       'onSubmit'

  onChange: =>
    @model.set
      title:       @$('[name=title]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    $.ajax "#{@collection.url}.json",
      headers:
        Accept: 'text/plain'
      type:     'POST'
      data:
        @model.toJSON()
      files:    @$('[name=file]')
      iframe:   true
      dataType: 'json'
      processData: false
      success: (data) =>
        @model.set data
        @collection.add @model
        @close()

close: =>
    Backbone.history.navigate "##{@collection.url}", trigger: true
