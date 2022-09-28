json.extract! instrutor, :id, :nome, :endereco, :cep, :cpf, :data_nascimento, :contato, :academium_id, :horario_trabalho, :email, :password, :created_at, :updated_at
json.url instrutor_url(instrutor, format: :json)
