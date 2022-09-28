require "test_helper"

class AcademiaTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  # teste salvar academia sem dados

  test "criar academia sem dados" do
    academia = Academium.new(nome: '', email: '', endereco: '', cnpj: '', contato: '', ativo: '')
    assert_not academia.save, "Salvar academia sem dados"
  end

  # teste salvar academia com dados corretos

  test "salvar academia sem proprietário" do
    academia = Academium.new(nome: 'Academiaaa', email: 'academia@gmail.com', endereco: 'Rua 1 2 3 Bairro Liberdade', cnpj: '11111111111111', contato: '87981025842', ativo: true, proprietario_id: '')
    assert_not academia.save, "Não é possível salvar uma academia sem vincular ela a um proprietário"
  end

  # teste salvar academia sem proprietario

  test "salvar academia sem cnpj e endereço" do
    academia = Academium.new(nome: 'Academia', email: 'academia@gmail.com', endereco: '', cnpj: '', contato: '87981025842', ativo: 'true')
    assert_not academia.save, "Não é possível criar uma academia sem um endereço e sem um cnpj"
  end

end
