Feature: instrutor
  As a proprietario
  I want to adicionar, remover, visualizar e editar instrutores
  So that instrutores possam acessar o sistema

  Scenario: cadastrar instrutor
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And eu estou na pagina de cadastro de instrutor
    When eu preencho o campo nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999', horario trabalho '06:00 - 12:00' e adiciono a academia de cnpj '62302383000100'
    And eu clico no botao Criar Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que a instrutor foi criado

  Scenario: visualizar instrutor na pagina de instrutores
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999' e horario trabalho '06:00 - 12:00' e adiciono a academia de cnpj '62302383000100'
    When eu estou na pagina dos instrutores
    Then eu visualizo o instrutor com cpf '12312312312'

  Scenario: visualizar perfil do instrutor
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999' e horario trabalho '06:00 - 12:00' e adiciono a academia de cnpj '62302383000100'
    And eu visualizo o instrutor com cpf '12312312312' na pagina de instrutores
    When eu clico no botao Ver Instrutor do instrutor de cpf '12312312312'
    Then eu sou redirecionado para a pagina do perfil do instrutor com cpf '12312312312' onde eu posso ver seus dados

  Scenario: editar instrutor
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999' e horario trabalho '06:00 - 12:00' e adiciono a academia de cnpj '62302383000100'
    And estou na pagina de edicao desse instrutor com cpf '12312312312'
    When eu edito os campos com os novos valores nome 'Instrutor Novo', email 'instrutor_novo@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999' e horario trabalho '14:00 - 18:00'
    And eu clico no botao Editar Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que o instrutor foi editado

  Scenario: remover instrutor
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And existe o instrutor que possui nome 'Instrutor Teste', email 'instrutor@email.com', senha 'senha123', endereco 'Rua Acaba Pelo Amor de Deus, 123, Boa Vista, Garanhuns - PE', cep '55555555', cpf '12312312312', data de nascimento '01/01/1995', contato '81999654999' e horario trabalho '06:00 - 12:00' e adiciono a academia de cnpj '62302383000100'
    And estou na pagina de visualizacao desse instrutor com cpf '12312312312'
    When eu clico no botao Remover Instrutor
    Then eu vejo uma mensagem de sucesso dizendo que o instrutor foi removido
