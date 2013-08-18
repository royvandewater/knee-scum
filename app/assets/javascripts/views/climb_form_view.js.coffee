class KneeScum.ClimbFormView extends Backbone.View
  template: JST['templates/climb_form']

  initialize: =>
    @model ?= @collection.build()

  events:
    'click .delete' : 'onClickDelete'
    'change'        : 'onChange'
    'submit'        : 'onSubmit'

  render: =>
    @$el.html @template model: @model.toJSON(), cid: @cid
    @$el

  onClickDelete: =>
    if confirm 'Are you sure?'
      @model.destroy
        success: =>
          Backbone.history.navigate @areaClimbsUrl(), trigger: true

  onChange: ($event) =>
    @model.set
      name:        @$('[name=name]').val()
      difficulty:  @$('[name=difficulty]').val()
      description: @$('[name=description]').val()

  onSubmit: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @collection.create @model, # Performs a PATCH if model exists
      success: =>
        Backbone.history.navigate @areaClimbUrl(), trigger: true

  areaClimbUrl: =>
    KneeScum.Paths.areaClimb @model.get('area_id'), @model.get('id')

  areaClimbsUrl: =>
    KneeScum.Paths.areaClimbs @model.get('area_id')
