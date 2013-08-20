class KneeScum.ClimbFormView extends Backbone.View
  template: JST['templates/climb_form']

  initialize: =>
    @model ?= @collection.build()
    @listenTo @model, 'destroy', @navigateToAreaClimbs
    @listenTo @model, 'sync',    @navigateToAreaClimb

  context: =>
    cid:   @cid
    model: @model.toJSON()

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
    name:        @$('[name=name]').val()
    difficulty:  @$('[name=difficulty]').val()
    description: @$('[name=description]').val()

  areaClimbUrl: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('id')

  areaClimbsUrl: =>
    KneeScum.Paths.areaClimbs @model.get('area_id')

  navigateToAreaClimb: =>
    Backbone.history.navigate @areaClimbUrl(), trigger: true

  navigateToAreaClimbs: =>
    Backbone.history.navigate @areaClimbsUrl(), trigger: true
