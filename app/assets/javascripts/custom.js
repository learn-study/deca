$(function() {
    $('input[type=text]:first').focus();
    $('input').bind("keydown", function(e) {
        var n = $("input").length;
        if (e.which == 13)
        {
            e.preventDefault();
            var nextIndex = $('input').index(this) + 1;
            if(nextIndex < n) {
                $('input')[nextIndex].focus();
            } else {
                $('input')[nextIndex-1].blur();
                $('#btn').click();
            }
        }
    });
});