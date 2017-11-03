jQuery ->
  actions = undefined
  $('#proposal_internal_control_action_id').parent().hide()
  actions = $('#proposal_internal_control_action_id').html()
  $('#proposal_internal_control_procedure_id').change ->
    procedure = undefined
    options = undefined
    escaped_procedure = undefined
    procedure = $('#proposal_internal_control_procedure_id :selected').text()
    escaped_procedure = procedure.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(actions).filter('optgroup[label=' + escaped_procedure + ']').html()
    console.log options
    if options
      $('#proposal_internal_control_action_id').html options
      $('#proposal_internal_control_action_id').parent().show()
    else
      $('#proposal_internal_control_action_id').empty()
      $('#proposal_internal_control_action_id').parent().hide()

