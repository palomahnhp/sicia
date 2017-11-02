jQuery(function() {
    var actions;
    actions = $('#proposal_internal_control_action_id').html();

    return $('#proposal_internal_control_procedure_id').change(function() {
        var procedure, options;
        procedure = $('#proposal_internal_control_procedure_id :selected').text();
        options = $(actions).filter("optgroup[label=" + procedure + "]").html();
        console.log(options);
        if (options) {
            return $('#proposal_internal_control_action_id').html(options);
        } else {
            return $('#proposal_internal_control_action_id').empty();
        }
    });
});