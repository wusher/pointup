class Pointup.Models.List extends Backbone.Model
  paramRoot: 'list'

  defaults:
    name: null

class Pointup.Collections.ListsCollection extends Backbone.Collection
  model: Pointup.Models.List
  url: '/lists'
