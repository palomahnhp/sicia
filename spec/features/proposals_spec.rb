require 'rails_helper'

RSpec.feature "Proposals", type: :feature do

  scenario "Index show data of proposals" do
    proposals = [create(:proposal, :sap_proposal), create(:proposal, :sap_proposal), create(:proposal, :sap_proposal)]

    visit proposals_path
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

  scenario "link to show proposal" do
    proposals = [create(:proposal, :sap_proposal), create(:proposal, :sap_proposal), create(:proposal, :sap_proposal)]

    visit proposals_path
    proposal = proposals.first
    within("#proposal_#{proposal.id}") do
      click_link 'Ver detalle'
    end
    expect(page).to have_content 'Consulta de propuesta'
  end

  scenario "link to edit proposal" do
    proposals = [create(:proposal, :sap_proposal), create(:proposal, :sap_proposal), create(:proposal, :sap_proposal)]

    visit proposals_path
    proposal = proposals.first

    within("#proposal_#{proposal.id}") do
      click_link 'Modificar'
    end
    expect(page).to have_content 'Editar propuesta'
  end

  scenario "link to mark requeriment" do
    proposals = [create(:proposal, :sap_proposal), create(:proposal, :sap_proposal), create(:proposal, :sap_proposal)]

    visit proposals_path
    proposal = proposals.first

    within("#proposal_#{proposal.id}") do
      click_link 'Marcar requisitos'
    end
    expect(page).to have_content 'Verificación de requisitos'
  end

  scenario "Show proposal" do
    proposal = create(:proposal, :sap_proposal)

    visit proposal_path(proposal)

    expect(page).to have_content 'Consulta de propuesta'

    expect(page).to have_content 'Cabecera de la propuesta'
    expect(page).to have_content "Ejercicio : #{proposal.trading_year}"
    expect(page).to have_content "Clase de propuesta SAP : #{proposal.sap_kind}"
    expect(page).to have_content "Número de propuesta SAP : #{proposal.sap_proposal}"
    expect(page).to have_content "Número de expediente : #{proposal.file_number}"
    expect(page).to have_content "Documento contable : #{proposal.accounting_document}"
    expect(page).to have_content "Importe total : #{proposal.amount}"

    expect(page).to have_content 'Tipo de expediente :'
    expect(page).to have_content "Expediente #{proposal.ic_file.description}"
    expect(page).to have_content "Procedimiento #{proposal.ic_procedure.description}"
    expect(page).to have_content "Trámite #{proposal.ic_action.description}"

    expect(page).to have_content 'Otra información'
    expect(page).to have_content "Fecha de recepción"
    expect(page).to have_content "Email para notificaciones"

  end

  scenario "Edit proposal" do
    proposal = create(:proposal, :sap_proposal)

    visit edit_proposal_path(proposal)

    expect(page).to have__content 'Editar propuesta'
    expect(page).to have__content 'Cabecera de la propuesta'
    expect(page).to have_content "Ejercicio : #{proposal.trading_year}"
    expect(page).to have_content "Clase de propuesta SAP : #{proposal.sap_kind}"
    expect(page).to have_content "Número de propuesta SAP : #{proposal.sap_proposal}"
    expect(page).to have_content "Número de expediente : #{proposal.file_number}"
    expect(page).to have_content "Documento contable : #{proposal.accounting_document}"
    expect(page).to have_content "Importe total : #{proposal.amount}"

    expect(page).to have_content 'Expediente :'
    expect(page).to have_content "Expediente #{proposal.ic_file.description}"
    expect(page).to have_content "Procedimiento #{proposal.ic_procedure.description}"
    expect(page).to have_content "Trámite #{proposal.ic_action.description}"

    expect(page).to have_content 'Otra información'
    expect(page).to have_content "Fecha de recepción"
    expect(page).to have_content "Email para notificaciones"

    expect(page).to have_button "Guardar propuesta"

  end

end

