import 'jquery'
import 'tablesorter'
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
                email: {
                    identifier: 'sign_up_email',
                    rules: [
                        {
                            type   : 'regExp',
                            value : '/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/i',
                            prompt : 'Please enter your name'
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
                            value: 'match[sign_up_password]',
                            prompt : 'Passwords does not match'
                        }
                    ]
                },
                username: {
                    identifier: 'username',
                    rules: [
                        {
                            type   : 'empty',
                            prompt : 'Please enter a username'
                        }
                    ]
                }
            }
        })
    ;
})