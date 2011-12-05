class Pointup.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new Pointup.Collections.TodosCollection()
    @todos.reset options.todos

  routes:
    "/new"      : "newTodo"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newTodo: ->
    @view = new Pointup.Views.Todos.NewView(collection: @todos)
    $("#todos").html(@view.render().el)

  index: ->
    @view = new Pointup.Views.Todos.IndexView(todos: @todos)
    $("#todos").html(@view.render().el)

  show: (id) ->
    todo = @todos.get(id)

    @view = new Pointup.Views.Todos.ShowView(model: todo)
    $("#todos").html(@view.render().el)

  edit: (id) ->
    todo = @todos.get(id)

    @view = new Pointup.Views.Todos.EditView(model: todo)
    $("#todos").html(@view.render().el)