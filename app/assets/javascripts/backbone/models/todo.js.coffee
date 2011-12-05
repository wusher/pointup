class Pointup.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    name: null
    completed: null
    points: null

class Pointup.Collections.TodosCollection extends Backbone.Collection
  model: Pointup.Models.Todo
  url: '/todos'
