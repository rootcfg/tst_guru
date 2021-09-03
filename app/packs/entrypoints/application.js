import 'jquery'
import 'fomantic-ui'

$(document).ready(function() {
    $('.message .close')
        .on('click', function() {
            console.log("button")
            $(this).closest('.message').transition('fade');
        })
    ;
})