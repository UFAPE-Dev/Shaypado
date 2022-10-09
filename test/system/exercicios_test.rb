require "application_system_test_case"

class ExerciciosTest < ApplicationSystemTestCase
  setup do
    @exercicio = exercicios(:one)
  end

  test "visiting the index" do
    visit exercicios_url
    assert_selector "h1", text: "Exercicios"
  end

  test "should create exercicio" do
    visit exercicios_url
    click_on "New exercicio"

    fill_in "Academium", with: @exercicio.academium_id
    fill_in "Calorias", with: @exercicio.calorias
    fill_in "Descricao", with: @exercicio.descricao
    fill_in "Dificuldade", with: @exercicio.dificuldade
    fill_in "Quantidade", with: @exercicio.quantidade
    fill_in "Tipo", with: @exercicio.tipo
    fill_in "Titulo", with: @exercicio.titulo
    click_on "Create Exercicio"

    assert_text "Exercicio was successfully created"
    click_on "Back"
  end

  test "should update Exercicio" do
    visit exercicio_url(@exercicio)
    click_on "Edit this exercicio", match: :first

    fill_in "Academium", with: @exercicio.academium_id
    fill_in "Calorias", with: @exercicio.calorias
    fill_in "Descricao", with: @exercicio.descricao
    fill_in "Dificuldade", with: @exercicio.dificuldade
    fill_in "Quantidade", with: @exercicio.quantidade
    fill_in "Tipo", with: @exercicio.tipo
    fill_in "Titulo", with: @exercicio.titulo
    click_on "Update Exercicio"

    assert_text "Exercicio was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercicio" do
    visit exercicio_url(@exercicio)
    click_on "Destroy this exercicio", match: :first

    assert_text "Exercicio was successfully destroyed"
  end
end
