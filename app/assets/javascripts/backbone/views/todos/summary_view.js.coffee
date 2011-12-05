Pointup.Views.Todos ||= {}

class Pointup.Views.Todos.SummaryView extends Backbone.View
  template: JST["backbone/templates/todos/summary"]


  render: =>
    console.log 'render'
    $(@el).html(@template(@model))

    return this


  tagName: "div"


      
