Pointup.Views.Todos ||= {}

class Pointup.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  initialize: () ->
    @options.todos.bind('reset', @addAll)
    @options.todos.bind('reset', @recalculate)
    @options.todos.bind('change', @recalculate)

  addAll: () =>
    @options.todos.each(@addOne)

  addOne: (todo) =>
    view = new Pointup.Views.Todos.TodoView({model : todo})
    if todo.get("completed")
      @$("#todos-completed").append(view.render().el)
    else 
      @$("#todos-open").append(view.render().el)

  render: =>
    $(@el).html(@template(todos: @options.todos.toJSON() ))
    @recalculate()
    @addAll()

    return this
  recalculate: () => 
    values = @get_totals(@options.todos)
    @summary.remove if @summary
    @summary = new Pointup.Views.Todos.SummaryView({ model : values})
    @$("#todos-summary").html(@summary.render().el)

  get_totals: () => 
    completed = 0
    open = 0 
    @options.todos.each (todo) -> 
      if todo.get("completed")
        completed += parseInt(todo.get("points"))
      else 
        open += parseInt(todo.get("points"))
    totals = 
      completed: completed
      open: open 
  

