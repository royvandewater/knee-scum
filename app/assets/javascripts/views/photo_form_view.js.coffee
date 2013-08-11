class KneeScum.PhotoFormView extends Backbone.View
  template: JST['templates/photo_form']

  initialize: =>
    @model ?= new @collection.model

  render: =>
    @$el.html @template model: @model
    @$el

  events:
    'click .close': 'onClickClose'
    'change':       'onChange'
    'submit':       'onSubmit'

  onClickClose: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @close()

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

  remove: =>
    @$('.modal').modal({show: false})
    $('.modal-backdrop').remove()
    super

  show: =>
    @$('.modal').modal()

  close: =>
    @remove()
    Backbone.history.navigate @collection.url, trigger: true

