Pointup.Views.Projects ||= {}

class Pointup.Views.Projects.ProjectView extends Backbone.View
  template: JST["backbone/templates/projects/project"]

  events:
    "click " : "select"

  tagName: "li"

  select: () ->
    $(@el).siblings().removeClass('selected')
    $(@el).addClass('selected')

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
