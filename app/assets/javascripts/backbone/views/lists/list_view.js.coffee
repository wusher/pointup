Pointup.Views.Lists ||= {}

class Pointup.Views.Lists.ListView extends Backbone.View
  template: JST["backbone/templates/lists/list"]

  events:
    "click" : "select"

  tagName: "li"

  select: () ->
    $(@el).siblings().removeClass('selected')
    $(@el).addClass('selected')


  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
