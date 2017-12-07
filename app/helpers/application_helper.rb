module ApplicationHelper

  def proposal_read_view
    (action_name == 'show' || action_name == 'mark_requeriment')
  end

  def proposal_requeriments(proposal, kind)
    ProposalRequeriment.by_proposal_and_kind_requeriment(proposal, kind)
  end

  def show_simple_date(date, options = {})
    return unless date

    format =  case date
                when Date
                  '%d/%m/%Y'
                when DateTime, ActiveSupport::TimeWithZone
                  '%d/%m/%Y %H:%M'
                else
                  '%d/%m/%Y'
              end
    l(date, { format: format }.merge(options)) if format
  end
end
