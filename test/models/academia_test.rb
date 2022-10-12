require "test_helper"

class AcademiaTest < ActiveSupport::TestCase
  test "the truth" do
     assert true
  end

  # teste salvar academia sem dados

  test "criar academia sem dados" do
    academia = Academium.new(nome: '', email_comercial: '', cnpj: '', contato_comercial: '', ativo: '')
    endereco = Endereco.new(logradouro: '', cep: '')
    academia.endereco = endereco
    assert_not academia.save, "Salvar academia sem dados"
  end

  # teste salvar academia com dados corretos

  test "salvar academia sem proprietário" do
    academia = Academium.new(nome: 'Academiaaa', email_comercial: 'academia@gmail.com', cnpj: '11111111111111', contato_comercial: '87981025842', ativo: true, proprietario_id: '')
    endereco = Endereco.new(logradouro: 'Rua 1', cep: '12345678')
    academia.endereco = endereco
    assert_not academia.save, "Não é possível salvar uma academia sem vincular ela a um proprietário"
  end

  # teste salvar academia sem proprietario

  test "salvar academia sem cnpj e endereço" do
    academia = Academium.new(nome: 'Academia', email_comercial: 'academia@gmail.com', cnpj: '', contato_comercial: '87981025842', ativo: 'true')
    endereco = Endereco.new(logradouro: '', cep: '')
    academia.endereco = endereco
    assert_not academia.save, "Não é possível criar uma academia sem um endereço e sem um cnpj"
  end

end
