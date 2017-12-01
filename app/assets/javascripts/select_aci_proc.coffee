jQuery ->
  actions = undefined
  $('#proposal_ic_action_id').parent().hide()
  actions = $('#proposal_ic_action_id').html()
  $('#proposal_ic_procedure_id').click ->
    procedure = undefined
    options = undefined
    escaped_procedure = undefined
    procedure = $('#proposal_ic_procedure_id :selected').text()
    escaped_procedure = procedure.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(actions).filter('optgroup[label=' + escaped_procedure + ']').html()
    console.log options
    if options
      $('#proposal_ic_action_id').html options
      $('#proposal_ic_action_id').parent().show()
    else
      $('#proposal_ic_action_id').empty()
      $('#proposal_ic_action_id').parent().hide()

