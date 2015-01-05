Module("Application.Casts.Show", function(Application){
    Application.fn.initialize = function() {

        $('#myTab a').click(function (e) {
          e.preventDefault()
          $(this).tab('show')
        });
    };
});