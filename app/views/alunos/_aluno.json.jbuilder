json.extract! aluno, :id, :nome, :endereco, :cep, :cpf, :data_nascimento, :contato, :senha, :created_at, :updated_at
json.url aluno_url(aluno, format: :json)
