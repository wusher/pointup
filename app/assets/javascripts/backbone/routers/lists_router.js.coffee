class Pointup.Routers.ListsRouter extends Backbone.Router
  initialize: (options) ->
    @lists = new Pointup.Collections.ListsCollection()
    @lists.reset 

  routes:
    "/:project_id"           : "index"
    "/:project_id/lists"     : "ensure_index"


  index: (project_id )->
    window.todo_router.clear()
    @lists.reset()
    @lists.url = window.project_router.projects.url + "/" + project_id + "/lists"
    @lists.fetch()

    @view = new Pointup.Views.Lists.IndexView(lists: @lists)
    $("#lists").html(@view.render().el)

  ensure_index: (project_id )->
    return if @lists.length > 0 
    @index(project_id)
