module ApplicationHelper

  def proposal_read_view
    (action_name == 'show' || action_name == 'mark_requeriment')
  end
end
