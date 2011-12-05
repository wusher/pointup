class Pointup.Routers.ProjectsRouter extends Backbone.Router
  initialize: (options) ->
    @projects = new Pointup.Collections.ProjectsCollection()
    @projects.reset options.projects

  routes:
    "/"    : "index"
    ".*"   : "index"

  index: ->
    @view = new Pointup.Views.Projects.IndexView(projects: @projects)
    $("#projects").html(@view.render().el)


