// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.Cell = (function(_super) {
    __extends(Cell, _super);

    function Cell() {
      _ref = Cell.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    Cell.prototype.initialize = function(params) {
      var b, g;

      this.set('n', params.n);
      this.set('x', params.x);
      this.set('y', params.y);
      this.set('alive', false);
      this.set('willLive', false);
      g = Math.floor(255 / params.n * (params.y + 1));
      b = Math.floor(255 / params.n * (params.x + 1));
      this.set('color', 'rgb(255, ' + g + ', ' + b + ')');
      return this.on('change:alive', function() {
        return this.trigger('stateChange', this);
      });
    };

    return Cell;

  })(Backbone.Model);

}).call(this);

/*
//@ sourceMappingURL=cell.map
*/
