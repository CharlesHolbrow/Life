// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.CellView = (function(_super) {
    __extends(CellView, _super);

    function CellView() {
      _ref = CellView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    CellView.prototype.tagName = 'td';

    CellView.prototype.initialize = function(params) {
      var _this = this;

      return this.model.on('change:alive', function() {
        if (_this.model.get('alive')) {
          return _this.$el.css({
            'background-color': _this.model.get('color')
          });
        } else {
          return _this.$el.css({
            'background-color': 'black'
          });
        }
      });
    };

    CellView.prototype.events = {
      'mouseenter': function(event) {
        return this.model.set('alive', !this.model.get('alive'));
      }
    };

    return CellView;

  })(Backbone.View);

}).call(this);

/*
//@ sourceMappingURL=cellView.map
*/
