/* ---------    Форма с изменением Title на старинце админа не должна отправляться ---------------- */
$('a#edit_test_title').on('click', function(e) {
    var val = $(this).data('testId');
    if($(this).text() == "Cancel") {
        $(this).text("Edit")
        $(`form[data-test-id="${val}"]`).hide();
    } else {
        if($(this).text() == "Edit") {
            $(this).text("Cancel")
            $(`form[data-test-id="${val}"]`).show();
        }
    }
});
/* ----------                    END OF FORM                                         ------------ */