Feature: instrutor
  As a proprietario
  I want to adicionar, remover, visualizar e editar instrutores
  So that instrutores possam acessar o sistema

  Scenario: cadastrar instrutor
    Given eu estou na pagina de cadastro de instrutor
    When eu preencho o campo nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '06:00 - 12:00'
    And eu clico no botao Criar Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que a instrutor foi criado

  Scenario: visualizar instrutor na pagina de instrutores
    Given existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '06:00 - 12:00'
    When eu estou na pagina dos instrutores
    Then eu visualizo o instrutor com cpf '123.123.123-12'

  Scenario: visualizar perfil do instrutor
    Given existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '06:00 - 12:00'
    And eu visualizo o instrutor com cpf '123.123.123-12'
    When eu clico no botao Ver Instrutor
    Then eu sou redirecionado para a pagina do perfil do instrutor com cpf '123.123.123-12' onde eu posso ver seus dados

  Scenario: editar instrutor
    Given existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '06:00 - 12:00'
    And estou na pagina de edicao desse instrutor com cpf '123.123.123-12'
    When eu edito os campos com os novos valores nome 'Instrutor Novo', email 'instrutor_novo@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '14:00 - 18:00'
    And eu clico no botao Editar Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que o instrutor foi editado

  Scenario: remover instrutor
    Given existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '123.123.123-12', data de nascimento '01/01/1995', contato '819996549999' e horario trabalho '06:00 - 12:00'
    And estou na pagina de visualizacao desse instrutor com cpf '123.123.123-12'
    When eu clico no botao Remover Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que o instrutor foi removido
