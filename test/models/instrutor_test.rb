require "test_helper"

class InstrutorTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "salvar instrutor sem dados" do
    instrutor = Instrutor.new(nome: '', cpf: '', data_nascimento: '', contato: '', horario_trabalho: '', email: '', password: '', academium_id: '')
    assert_not instrutor.save, "Não é possível salvar um instrutor sem dados"
  end

  test "salvar um instrutor sem academia" do
    instrutor = Instrutor.new(nome: 'Marcelino', cpf: '11111111111', data_nascimento: Date.yesterday, contato: '11111111111', horario_trabalho: Time.now, email: 'email@email.com', password: '111111', academium_id: '')
    endereco = Endereco.new(cep: '11111111', logradouro: 'Rua Josefa')
    instrutor.endereco = endereco
    assert_not instrutor.save, "Não é possível salvar um instrutor sem vinculá-lo a uma academia"
  end

  test "salvar um instrutor sem email e senha" do
    instrutor = Instrutor.new(nome: 'Marcelino', cpf: '11111111111', data_nascimento: Date.yesterday, contato: '11111111111', horario_trabalho: Time.now, email: '', password: '', academium_id: 1)
    endereco = Endereco.new(cep: '11111111', logradouro: 'Rua Josefa')
    instrutor.endereco = endereco
    assert_not instrutor.save, "Não é possível salvar um instrutor sem e-mail e senha para entrar no sistema"
  end
end
