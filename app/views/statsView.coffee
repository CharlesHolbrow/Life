class window.StatsView extends Backbone.View

  template: _.template '
    <span class="count">n = <%= n %>, # active cells: <%= aliveCells %></span>
  '

  initialize: ->
    @render()

    @model.on 'change:aliveCells', =>
      @render()

  render: ->
    @$el.empty()
    @$el.html @template(@model.attributes)