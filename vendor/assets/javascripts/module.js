;(function(context){
  "use strict";

  // Create a new module.
  // Define the namespace and runs the specified callback.
  // By default, the last namespace component will be defined as
  // as function. You can create a regular object by setting the
  // third argument to anything you want.
  //
  //     Module("Todo.Application", function(Application){
  //       Application.fn.initialize = function(){};
  //     });
  //
  // The module's prototype will be defined as a shortcut called `Module#fn`.
  // Any initialization must be performed on the `Module#initialize()` function.
  function Module(namespace, callback, object) {
    var components = namespace.split(/[.:]+/)
      , scope = context
      , component
      , last
    ;

    if (typeof callback !== "function") {
      object = callback;
      callback = null;
    }

    object = object || build();

    // Process all components but the last, which will store the
    // specified object attribute.
    for (var i = 0, count = components.length; i < count; i++) {
      last = (i == count - 1);
      scope[components[i]] = (last ? object : scope[components[i]] || {});
      scope = scope[components[i]];
    }

    if (callback) {
      callback.call(scope, scope, scope.prototype);
    }

    return scope;
  }

  // Retrieve a module by its namespace. Return null if not defined.
  Module.fetch = function(namespace) {
    var components = namespace.split(".")
      , scope = context
    ;

    for (var i = 0, count = components.length; i < count; i++) {
      scope = scope[components[i]];

      if (!scope) {
        break;
      }
    }

    return scope;
  };

  // Run the specified module and return the instance.
  Module.run = function(namespace, args) {
    var module = Module.fetch(namespace);

    if (typeof module === 'function') {
      return module.apply(null, args || []);
    }
  };

  // Build a new module with the correct attributes and methods.
  function build() {
    var Constructor, Instance;

    Constructor = function() {
      // Initialize a new instance, which won't do nothing but
      // inheriting the prototype.
      var instance = new Instance();

      // Apply the initializer on the given instance.
      instance.initialize.apply(instance, arguments);

      return instance;
    };

    // Define the function that will be used to
    // initialize the instance.
    Instance = function() {};
    Instance.prototype = Constructor.prototype;

    // Save some typing and make an alias to the prototype.
    Constructor.fn = Constructor.prototype;

    // Define a noop initializer.
    Constructor.fn.initialize = function() {};

    return Constructor;
  }

  // Sometimes you want to define your own wrapper, with custom initialization.
  // In this case, you can use the `Module.wrapper` function.
  //
  //     Module.wrapper("MyApp.Model", function(namespace, callback){
  //       Module(namespace, function(Model){
  //         $.extend(Model, Validations);
  //         $.extend(Model, MassAssignment);
  //
  //         Model.fn.initialize = function(attributes) {
  //           this.assignAttributes(attributes);
  //         };
  //       });
  //     });
  //
  //     MyApp.Model("MyApp.User", function(User){
  //       User.validates("name", {presence: true});
  //     });
  //
  //     var user = MyApp.User();
  //
  Module.wrapper = function(namespace, initializer) {
    return Module(namespace, function(Definition) {
      Definition.fn.initialize = function(namespace, callback) {
        initializer.apply(Definition, arguments);
      };

      return Definition;
    });
  };

  // Expose the module function.
  context.Module = Module;
})(window);
