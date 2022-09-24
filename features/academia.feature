Feature: academia
  As a proprietario
  I want to adicionar, remover, visualizar e editar minhas academias
  So that eu consiga gerenciar instrutores e alunos na minha academia

  Scenario: cadastrar academia
    Given eu estou na pagina de cadastro de academia
    When eu preencho o campo nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999999'
    And eu clico no botao Criar Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi criada

  Scenario: visualizar academia na pagina de academias
    Given existe a academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999999'
    When eu estou na pagina das minhas academias
    Then eu visualizo a academia com cnpj '62.302.383/0001-00'

  Scenario: visualizar perfil da academia
    Given existe a academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999999'
    And eu visualizo a academia com cnpj '62.302.383/0001-00'
    When eu clico no botao Ver Academia
    Then eu sou redirecionado para a pagina do perfil da academia com cnpj '62.302.383/0001-00' onde eu posso ver seus dados

  Scenario: editar academia
    Given existe a academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999999'
    And estou na pagina de edicao dessa academia com cnpj '62.302.383/0001-00'
    When eu edito os campos com os novos valores nome 'Academia Novo', email 'academia_novo@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999988'
    And eu clico no botao Editar Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi editada

  Scenario: remover academia
    Given existe a academia que possui nome 'Academia Teste', email 'academia@email.com', endereco 'Avenida Bom Pastor, 123, Boa Vista, Garanhuns - PE', cnpj '62.302.383/0001-00' e contato '81999999999'
    And estou na pagina de visualizacao dessa academia com cnpj '62.302.383/0001-00'
    When eu clico no botao Remover Academia
    Then eu vejo uma mensagem de sucesso dizendo que a academia foi removida
