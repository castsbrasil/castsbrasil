Module("Application", function(Application){
    Application.fn.initialize = function() {
        body = $('body');
        controller_name = body.attr('controller_name');
        action_name = body.attr('action_name');
        Module.run(['Application', controller_name].join("."));
        Module.run(['Application', controller_name, action_name].join("."));
    };
});