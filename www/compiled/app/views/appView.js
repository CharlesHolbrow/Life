// Generated by CoffeeScript 1.6.2
(function() {
  var _ref,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.AppView = (function(_super) {
    __extends(AppView, _super);

    function AppView() {
      _ref = AppView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    AppView.prototype.template = _.template('\
    <button id="step">Step</button>\
    <button id="run">Run</button>\
    <button id="stop" disabled>Stop</button>\
    ');

    AppView.prototype.initialize = function() {
      var _this = this;

      this.render();
      return this.model.on('change:running', function() {
        if (_this.model.get('running')) {
          $('#stop').attr({
            'disabled': false
          });
          return $('#run').attr({
            'disabled': true
          });
        } else {
          $('#run').attr({
            'disabled': false
          });
          return $('#stop').attr({
            'disabled': true
          });
        }
      });
    };

    AppView.prototype.events = {
      'click button#step': function() {
        return this.model.get('board').step();
      },
      'click button#run': function() {
        return this.model.run();
      },
      'click button#stop': function() {
        return this.model.stop();
      }
    };

    AppView.prototype.render = function() {
      this.$el.html(this.template());
      this.$el.append(new StatsView({
        model: this.model.get('board')
      }).el);
      return this.$el.append(new BoardView({
        model: this.model.get('board')
      }).el);
    };

    return AppView;

  })(Backbone.View);

}).call(this);

/*
//@ sourceMappingURL=appView.map
*/
