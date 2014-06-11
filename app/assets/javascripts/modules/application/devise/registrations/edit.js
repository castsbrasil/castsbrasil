Module("Application.Devise.Registrations.Edit", function(Application){
    Application.fn.initialize = function() {
        $('#password').tooltip({ 'placement': 'bottom' });
        $('#current_password').tooltip({ 'placement': 'bottom' });
    };
});