jQuery ->
  procedures = undefined
  $('#proposal_ic_procedure_id').parent().hide()
  procedures = $('#proposal_ic_procedure_id').html()
  $('#proposal_ic_file_id').click ->
    file = undefined
    escaped_file = undefined
    options = undefined
    $('#proposal_ic_procedure_id').parent().hide()
    $('#proposal_ic_action_id').parent().hide()
    file = $('#proposal_ic_file_id :selected').text()
    escaped_file = file.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(procedures).filter('optgroup[label=' + escaped_file + ']').html()
    console.log options
    if options
      $('#proposal_ic_procedure_id').html options
      $('#proposal_ic_procedure_id').parent().show()
    else
      $('#proposal_ic_procedure_id').empty()
      $('#proposal_ic_procedure_id').parent().hide()
