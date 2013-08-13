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
    @$('.modal-dialog').addClass @modal?.modalClass
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

    if @modal.fillScreen
      @$('img.main-photo').load =>
        maxHeight = $(window).height() - 180
        maxWidth  = $(window).width() - 80

        imgHeight = @$('img.main-photo')[0].naturalHeight
        imgWidth  = @$('img.main-photo')[0].naturalWidth

        if imgHeight > maxHeight
          imgWidth = imgWidth * (maxHeight / imgHeight)
          imgHeight = maxHeight
          @$('img.main-photo').css height: imgHeight, width: imgWidth
          @$('.modal-dialog').css width: "#{imgWidth + 13}px"
        if imgWidth > maxWidth
          imgHeight = imgHeight * (maxWidth / imgWidth)
          imgWidth  = maxWidth
          @$('img.main-photo').css height: imgHeight, width: imgWidth
          @$('.modal-dialog').css  width: "#{imgWidth + 13}px"

  remove: =>
    $('.modal-backdrop').remove()
    super
