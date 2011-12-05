class Pointup.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new Pointup.Collections.TodosCollection()
    @todos.reset 

  routes:
    "/:project_id/lists/:list_id"    : "index"


  index: (project_id, list_id) ->
    window.list_router.ensure_index(project_id)
    @todos.reset()
    @todos.url = window.list_router.lists.url + "/" + list_id + "/todos"
    @todos.fetch()

    @view = new Pointup.Views.Todos.IndexView(todos: @todos)
    $("#todos").html(@view.render().el)


  clear: -> 
    $("#todos").html('Please select a list')

