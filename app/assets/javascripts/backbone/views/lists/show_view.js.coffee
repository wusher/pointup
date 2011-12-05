Pointup.Views.Lists ||= {}

class Pointup.Views.Lists.ShowView extends Backbone.View
  template: JST["backbone/templates/lists/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
