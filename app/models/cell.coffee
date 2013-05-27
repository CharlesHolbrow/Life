class window.Cell extends Backbone.Model

  initialize: (params) ->
    @set 'x', params.x
    @set 'y', params.y
    @set 'alive', false
    @set 'willLive', false
