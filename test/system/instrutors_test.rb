require "application_system_test_case"

class InstrutorsTest < ApplicationSystemTestCase
  setup do
    @instrutor = instrutors(:one)
  end

  test "visiting the index" do
    visit instrutors_url
    assert_selector "h1", text: "Instrutors"
  end

  test "should create instrutor" do
    visit instrutors_url
    click_on "New instrutor"

    fill_in "Academium", with: @instrutor.academium_id
    fill_in "Contato", with: @instrutor.contato
    fill_in "Cpf", with: @instrutor.cpf
    fill_in "Data nascimento", with: @instrutor.data_nascimento
    fill_in "Email", with: @instrutor.email
    fill_in "Horario trabalho", with: @instrutor.horario_trabalho
    fill_in "Nome", with: @instrutor.nome
    fill_in "Password", with: @instrutor.password
    click_on "Create Instrutor"

    assert_text "Instrutor was successfully created"
    click_on "Back"
  end

  test "should update Instrutor" do
    visit instrutor_url(@instrutor)
    click_on "Edit this instrutor", match: :first

    fill_in "Academium", with: @instrutor.academium_id
    fill_in "Contato", with: @instrutor.contato
    fill_in "Cpf", with: @instrutor.cpf
    fill_in "Data nascimento", with: @instrutor.data_nascimento
    fill_in "Email", with: @instrutor.email
    fill_in "Horario trabalho", with: @instrutor.horario_trabalho
    fill_in "Nome", with: @instrutor.nome
    fill_in "Password", with: @instrutor.password
    click_on "Update Instrutor"

    assert_text "Instrutor was successfully updated"
    click_on "Back"
  end

  test "should destroy Instrutor" do
    visit instrutor_url(@instrutor)
    click_on "Destroy this instrutor", match: :first

    assert_text "Instrutor was successfully destroyed"
  end
end
