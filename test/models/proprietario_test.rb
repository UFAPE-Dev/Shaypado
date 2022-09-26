require "test_helper"

class ProprietarioTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  #teste de salvar proprietario corretamente

  test "salvar proprietario corretamente" do
    @proprietario = Proprietario.new
    @user = User.new(nome: "Teste Pedro", password: "123456", password_confirmation: "123456", email: "testeemail@email.com", cpf: "12345678911", endereco: "endereco teste", cep: "55385000", data_nascimento: Date.yesterday, contato: "84756984522", horario_trabalho: "08:15")
    @user.userable = @proprietario
    assert @user.save, "Todos os dados estão corretos"
  end

  #teste de salvar proprietario sem dados

  test "salvar proprietario sem dados" do
    @proprietario = Proprietario.new
    @user = User.new(nome: "", password: "", password_confirmation: "", email: "", cpf: "", endereco: "", cep: "", data_nascimento: "", contato: "", horario_trabalho: "")
    @user.userable = @proprietario
    assert_not @user.save, "Não é possível salvar proprietários sem dados"
  end

  #teste de salvar proprietario com cpf incorreto

  test "salvar proprietario com cpf incorreto" do
    @proprietario = Proprietario.new
    @user = User.new(nome: "Teste Pedro", password: "123456", password_confirmation: "123456", email: "testeemail@email.com", cpf: "a", endereco: "endereco teste", cep: "55385000", data_nascimento: Date.yesterday, contato: "84756984522", horario_trabalho: "08:15")
    @user.userable = @proprietario
    assert_not @user.save, "O CPF está incorreto"
  end

end
