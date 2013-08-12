class KneeScum.TwoPanelView extends Backbone.View
  template: JST['templates/two_panel']

  initialize: (left: @left, right: @right, modal: @modal) =>

  events: =>
    'click .close-modal': 'onClickCloseModal'

  render: =>
    @$el.html @template()
    @$('.left-panel ').html   @left?.render()
    @$('.right-panel').html   @right?.render()
    @$('.modal-content').html @modal?.render()
    @$el

  onClickCloseModal: ($event) =>
    $event.preventDefault()
    $event.stopPropagation()
    @closeModal()

  closeModal: =>
    @modal.close()

  show_modal: =>
    return unless @modal?
    @$('.modal').modal().on 'hidden.bs.modal', @closeModal

  remove: =>
    $('.modal-backdrop').remove()
    super
