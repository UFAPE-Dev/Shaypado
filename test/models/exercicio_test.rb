require "test_helper"

class ExercicioTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "salvar exercicio sem dados" do
    exercicio = Exercicio.new(titulo: "", dificuldade: "", calorias: "", descricao: "", quantidade: "", tipo: "", academium_id: "")
    assert_not exercicio.save, "Não é possível salvar o exercicio sem dados"
  end

  test "salvar exercicio sem academia" do
    exercicio = Exercicio.new(titulo: "TITULO", dificuldade: "fácil", calorias: "1500", descricao: "AAAAAAAAAAa", quantidade: "1", tipo: "braço", academium_id: "")
    assert_not exercicio.save, "Não é possível salvar o exercicio sem academia"
  end

  test "salvar exercicio sem calorias e descrição" do
    exercicio = Exercicio.new(titulo: "TITULO", dificuldade: "fácil", calorias: "", descricao: "", quantidade: "1", tipo: "braço", academium_id: "1")
    assert_not exercicio.save, "Não é possível salvar o exercicio sem dados"
  end
end
