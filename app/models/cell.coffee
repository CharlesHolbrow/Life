class window.Cell extends Backbone.Model

  initialize: (params) ->
    @set 'n', params.n
    @set 'x', params.x
    @set 'y', params.y
    @set 'alive', false
    @set 'willLive', false
    g = Math.floor(255 / params.n * (params.y + 1))
    b = Math.floor(255 / params.n * (params.x + 1))
    @set 'color', 'rgb(115, '+g+', '+b+')'
