require "test_helper"

class AlunoTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "criar aluno sem dados" do
    aluno = Aluno.new(nome: '', endereco: '', cep: '', cpf: '', data_nascimento: '', contato: '', senha: '', academium_id: '')
    assert_not aluno.save, "Não é possível salvar um aluno sem dados"
  end

  test "criar aluno sem academia" do
    aluno = Aluno.new(nome: 'Josefa', endereco: 'Rua Josefa', cep: '111111111', cpf: '11111111111', data_nascimento: Time.zone.today, contato: '11111111111', senha: '111111', academium_id: '')
    assert_not aluno.save, "Não é possível salvar um aluno sem academia"
  end

  test "criar aluno sem senha" do
    aluno = Aluno.new(nome: 'Josefa', endereco: 'Rua Josefa', cep: '111111111', cpf: '11111111111', data_nascimento: Time.zone.today, contato: '11111111111', senha: '', academium_id: '1')
    assert_not aluno.save, "Não é possível salvar um aluno sem uma senha de acesso"
  end
end
