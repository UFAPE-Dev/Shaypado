require "test_helper"

class AcademiaTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  # teste salvar academia sem dados

  test "criar academia sem dados" do
    academia = Academia.new(id_proprietario: '', integer: '', nome: '', email: '', endereco: '', cpf: '', contato: '', ativo:'')
    assert_not academia.save, "Salvar academia sem dados"
  end

  # teste salvar academia com dados corretos

  test "salvar academia corretamente" do
    academia = Academia.new(id_proprietario: '1', integer: '1', nome: 'Academia', email: 'academia@gmail.com', endereco: 'Rua 1 2 3 Bairro Liberdade', cpf: '11111111', contato: '87981025842', ativo:'true')
    assert academia.save, "Todos os dados estão corretos"
  end

  # teste salvar academia sem proprietario

  test "salvar academia sem proprietário" do
    academia = Academia.new(id_proprietario: '', integer: '1', nome: 'Academia', email: 'academia@gmail.com', endereco: 'Rua 1 2 3 Bairro Liberdade', cpf: '11111111', contato: '87981025842', ativo:'true')
    assert_not academia.save, "Não é possível criar uma academia sem estar ligado a um proprietário"
  end

end
