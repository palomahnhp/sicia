jQuery(function() {
    var procedures;
    procedures = $('#proposal_internal_control_procedure_id').html();
    var actions;
    actions = $('#proposal_internal_control_action_id').html();
    return $('#proposal_internal_control_file_id').change(function() {
        var file, options;
        file = $('#proposal_internal_control_file_id :selected').text();
        options = $(procedures).filter("optgroup[label=" + file + "]").html();
        console.log(options);
        if (options) {
            return $('#proposal_internal_control_procedure_id').html(options);
        } else {
            return $('#proposal_internal_control_procedure_id').empty();
        }
    });

});