module ApplicationHelper

  def proposal_read_view
    (action_name == 'show' || action_name == 'mark_requeriment')
  end

  def format_proposal_field(proposal, field)
    case field
      when :sicia_number
        proposal.formatted_sicia_number
      # index without id
      when :society_id, :manager_body_id, :approval_body_id, :society, :manager_body, :approval_body
       field = field.to_s.gsub("_id", "").to_sym
       proposal.send(field).code_and_description
      else
       proposal.send(field)
    end
  end

end

