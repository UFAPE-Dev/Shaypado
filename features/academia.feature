Feature: academia
  As a proprietario
  I want to adicionar, remover, visualizar e editar minhas academias
  So that eu consiga gerenciar instrutores e alunos na minha academia

  Scenario: cadastrar academia
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And eu estou na pagina de cadastro de academia
    When eu preencho os dados para o proprietario com cpf '12345678900' os campos nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And eu clico no botao Criar Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi criada

  Scenario: visualizar academia na pagina de academias
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    When eu estou na pagina das minhas academias
    Then eu visualizo a academia com cnpj '62302383000100'

  Scenario: visualizar perfil da academia
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And eu visualizo a academia com cnpj '62302383000100' na pagina de academias
    When eu clico no botao Ver Academia da academia com cnpj '62302383000100'
    Then eu sou redirecionado para a pagina do perfil da academia com cnpj '62302383000100' onde eu posso ver seus dados

  Scenario: editar academia
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And estou na pagina de edicao dessa academia com cnpj '62302383000100'
    When eu edito os campos com os novos valores nome 'Academia Novo', email 'academia_novo@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999988'
    And eu clico no botao Editar Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi editada

  Scenario: remover academia
    Given existe um proprietario com nome 'Proprietário', endereco 'Test de endereco', cep '55385000', cpf '12345678900', data_nascimento '10/10/1990', contato '21547896322', email 'email@email.com' e password '123123123'
    And esse proprietario de cpf '12345678900' tem academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62302383000100' e contato '81999999999'
    And estou na pagina de visualizacao dessa academia com cnpj '62302383000100'
    When eu clico no botao Remover Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi removida
