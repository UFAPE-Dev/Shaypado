require "application_system_test_case"

class AcademiaTest < ApplicationSystemTestCase
  setup do
    @academium = academia(:one)
  end

  test "visiting the index" do
    visit academia_url
    assert_selector "h1", text: "Academia"
  end

  test "should create academium" do
    visit academia_url
    click_on "New academium"

    check "Ativo" if @academium.ativo
    fill_in "Cnpj", with: @academium.cnpj
    fill_in "Contato", with: @academium.contato
    fill_in "Email", with: @academium.email
    fill_in "Endereco", with: @academium.endereco
    fill_in "Nome", with: @academium.nome
    fill_in "Proprietario", with: @academium.proprietario_id
    click_on "Create Academium"

    assert_text "Academium was successfully created"
    click_on "Back"
  end

  test "should update Academium" do
    visit academium_url(@academium)
    click_on "Edit this academium", match: :first

    check "Ativo" if @academium.ativo
    fill_in "Cnpj", with: @academium.cnpj
    fill_in "Contato", with: @academium.contato
    fill_in "Email", with: @academium.email
    fill_in "Endereco", with: @academium.endereco
    fill_in "Nome", with: @academium.nome
    fill_in "Proprietario", with: @academium.proprietario_id
    click_on "Update Academium"

    assert_text "Academium was successfully updated"
    click_on "Back"
  end

  test "should destroy Academium" do
    visit academium_url(@academium)
    click_on "Destroy this academium", match: :first

    assert_text "Academium was successfully destroyed"
  end
end
