Pointup.Views.Lists ||= {}

class Pointup.Views.Lists.EditView extends Backbone.View
  template : JST["backbone/templates/lists/edit"]

  events :
    "submit #edit-list" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (list) =>
        @model = list
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
