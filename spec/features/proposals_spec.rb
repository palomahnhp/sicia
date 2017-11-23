require 'rails_helper'

RSpec.feature "Proposals", type: :feature do
  scenario 'Index' do
    proposals = [create(:proposal), create(:proposal), create(:proposal)]

    visit proposals_path
    save_and_open_page
    expect(page).to have_selector("#proposal_#{proposal.id}", count: 3)
    proposals.each do |proposal|
      within('#proposals') do
        expect(page).to have_content proposal.trading_year
        expect(page).to have_content proposal.description
        expect(page).to have_css("a[href='#{proposal(proposal)}']", text: "")
      end
    end
  end
end
