import 'jquery'
import 'tablesorter'
import './form_inline'
import './progress_bar'
import 'fomantic-ui'

$(document).ready(function() {
    $('.message .close')
        .on('click', function() {
            $(this).closest('.message').transition('fade');
        })
    ;

    $("#sortedMy").tablesorter();
    $('.ui.form')
        .form({
            fields: {
                sign_up_email: {
                    identifier: 'sign_up_email',
                    rules: [
                        {
                            type   : 'email',
                            prompt : 'Email is not valid'
                        }
                    ]
                },
                sign_up_password: {
                    identifier: 'sign_up_password',
                    rules: [
                        {
                            type   : 'minLength[6]',
                            prompt : 'Min Length 6 symbols'
                        }
                    ]
                },
                sign_up_password_confirmation: {
                    identifier: 'sign_up_password_confirmation',
                    rules: [
                        {
                            type   : 'match',
                            value  : 'sign_up_password',
                            prompt : 'Passwords does not match'
                        }
                    ]
                }
            }
        })
    ;

});