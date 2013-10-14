class KneeScum.ClimbFormView extends Backbone.View
  template: JST['templates/climb_form']

  initialize: =>
    @model ?= @collection.build()
    @listenTo @model, 'invalid', @render
    @listenToOnce @model, 'destroy', @navigateToAreaClimbs
    @listenToOnce @model, 'sync',    @navigateToAreaClimb

  context: =>
    cid:    @cid
    model:  @model.toJSON()
    errors: @model.validationError

  render: =>
    @$el.html @template @context()
    @$el

  events:
    'click .delete' : 'onClickDelete'
    'submit'        : 'onSubmit'

  onClickDelete: =>
    @model.destroy() if confirm 'Are you sure?'

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @model.save @formData()

  formData: =>
    approach:    @$('[name=approach]').val()
    description: @$('[name=description]').val()
    difficulty:  @$('[name=difficulty]').val()
    name:        @$('[name=name]').val()
    protection:  @$('[name=protection]').val()

  areaClimbUrl: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('id')

  areaClimbsUrl: =>
    KneeScum.Paths.areaClimbs @model.get('area_id')

  navigateToAreaClimb: =>
    Backbone.history.navigate @areaClimbUrl(), trigger: true

  navigateToAreaClimbs: =>
    Backbone.history.navigate @areaClimbsUrl(), trigger: true
