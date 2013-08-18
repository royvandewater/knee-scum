class KneeScum.AreaFormView extends Backbone.View
  template: JST['templates/area_form']

  initialize: =>
    @model ?= @collection.build()

  context: =>
    cid:   @cid
    model: @model.toJSON()


  render: =>
    @$el.html @template model: @model.toJSON(), cid: @cid
    @$el

  events:
    'click .delete': 'onClickDelete'
    'change':        'onChange'
    'submit':        'onSubmit'

  onClickDelete: ($event) =>
    $event.preventDefault()
    if confirm 'Are you sure?'
      @model.destroy
        success: =>
          Backbone.history.navigate KneeScum.Paths.areas(), trigger: true

  onChange: ($event) =>
    @model.set
      name:        @$('[name=name]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @model.save {},
      success: (data) =>
        @collection.add @model
        Backbone.history.navigate KneeScum.Paths.areaClimbs(@model.id), trigger: true
