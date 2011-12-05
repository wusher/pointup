class Pointup.Models.Project extends Backbone.Model
  paramRoot: 'project'

  defaults:
    name: null

class Pointup.Collections.ProjectsCollection extends Backbone.Collection
  model: Pointup.Models.Project
  url: '/projects'
