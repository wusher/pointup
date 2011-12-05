Pointup.Views.Lists ||= {}

class Pointup.Views.Lists.NewView extends Backbone.View
  template: JST["backbone/templates/lists/new"]

  events:
    "submit #new-list": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (list) =>
        @model = list
        window.location.hash = "/#{@model.id}"

      error: (list, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
