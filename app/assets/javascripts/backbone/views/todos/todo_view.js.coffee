Pointup.Views.Todos ||= {}

class Pointup.Views.Todos.TodoView extends Backbone.View
  template: JST["backbone/templates/todos/todo"]

  events:
    "click .display"        : "enterEdit"
    "keypress .point-input" : 'updateOnEnter'

  tagName: "li"

  enterEdit: ->
    $('.todo', @el).addClass 'editing'
    $('input', @el).first().focus()

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
  
  exitEdit: -> 
    @model.save( { points: $('input', @el).first().val() })
    @render()


  updateOnEnter: (e) ->
    @exitEdit() if e.keyCode == 13 #enter
    @render()   if e.keyCode == 27 #escape
