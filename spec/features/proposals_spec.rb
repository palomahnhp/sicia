require 'rails_helper'

RSpec.feature "Proposals", type: :feature do
  scenario 'Index' do
    proposals = [create(:proposal, :sap_proposal), create(:proposal, :sap_proposal), create(:proposal, :sap_proposal)]

    visit proposals_path
    save_and_open_page
    expect(page).to have_selector(".proposal-row", count: 3)
    proposals.each do |proposal|
      within("#proposal_#{proposal.id}") do
        expect(page).to have_content proposal.trading_year
        expect(page).to have_content proposal.file_number
        expect(page).to have_content proposal.title
        expect(page).to have_content proposal.manager_body
        expect(page).to have_content proposal.amount
      end
    end
  end
end
