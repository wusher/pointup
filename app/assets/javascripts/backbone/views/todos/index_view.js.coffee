Pointup.Views.Todos ||= {}

class Pointup.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  initialize: () ->
    @options.todos.bind('reset', @addAll)

  addAll: () =>
    @options.todos.each(@addOne)

  addOne: (todo) =>
    view = new Pointup.Views.Todos.TodoView({model : todo})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(todos: @options.todos.toJSON() ))
    @addAll()

    return this
