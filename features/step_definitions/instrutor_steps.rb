Given('eu estou na pagina de cadastro de instrutor') do
  visit '/instrutors/new'
  expect(page).to have_content 'New instrutor'
end

When('eu preencho o campo nome {string}, email {string}, senha {string}, endereco {string}, cep {string}, cpf {string}, data de nascimento {string}, contato {string}, horario trabalho {string} e adiciono a academia de cnpj {string}' ) do |nome, email, senha, endereco, cep, cpf, data, contato, horario, cnpj|
  academia = Academium.where(cnpj: cnpj).first.id

  fill_in 'instrutor[nome]', :with => nome
  fill_in 'instrutor[email]', :with => email
  fill_in 'instrutor[password]', :with => senha
  fill_in 'instrutor[endereco]', :with => endereco
  fill_in 'instrutor[cep]', :with => cep
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[data_nascimento]', :with => data
  fill_in 'instrutor[contato]', :with => contato
  fill_in 'instrutor[horario_trabalho]', :with => horario
  find("#instrutor_academium_id option[value='#{academia}']").select_option
end

When('eu clico no botao Criar Instrutor') do
  click_button 'Create Instrutor'
end

Then('eu vejo uma mensagem de sucesso dizendo que a instrutor foi criado') do
  expect(page).to have_content('Instrutor was successfully created.')
end

Given('existe o instrutor que possui nome {string}, email {string}, senha {string}, endereco {string}, cep {string}, cpf {string}, data de nascimento {string}, contato {string} e horario trabalho {string} e adiciono a academia de cnpj {string}') do |nome, email, senha, endereco, cep, cpf, data, contato, horario, cnpj|
  visit '/instrutors/new'

  academia = Academium.where(cnpj: cnpj).first.id

  fill_in 'instrutor[nome]', :with => nome
  fill_in 'instrutor[email]', :with => email
  fill_in 'instrutor[password]', :with => senha
  fill_in 'instrutor[endereco]', :with => endereco
  fill_in 'instrutor[cep]', :with => cep
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[data_nascimento]', :with => data
  fill_in 'instrutor[contato]', :with => contato
  fill_in 'instrutor[horario_trabalho]', :with => horario
  find("#instrutor_academium_id option[value='#{academia}']").select_option

  click_button 'Create Instrutor'

  expect(page).to have_content(cpf)
end

When('eu estou na pagina dos instrutores') do
  visit '/instrutors'
  expect(page).to have_content('Instrutors')
end

Then('eu visualizo o instrutor com cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
end

Given('eu visualizo o instrutor com cpf {string} na pagina de instrutores') do |cpf|
  visit '/instrutors'
  expect(page).to have_content cpf
end

When('eu clico no botao Ver Instrutor do instrutor de cpf {string}') do |cpf|
  id = Instrutor.where(cpf: cpf).first.id
  find("a[href='/instrutors/#{id}']").click
end

Then('eu sou redirecionado para a pagina do perfil do instrutor com cpf {string} onde eu posso ver seus dados') do |cpf|
  expect(page).to have_content(cpf)
end

Given('estou na pagina de edicao desse instrutor com cpf {string}') do |cpf|
  id = Instrutor.where(cpf: cpf).first.id
  visit "/instrutors/#{id}/edit"
end

When('eu edito os campos com os novos valores nome {string}, email {string}, senha {string}, endereco {string}, cep {string}, cpf {string}, data de nascimento {string}, contato {string} e horario trabalho {string}') do |nome, email, senha, endereco, cep, cpf, data, contato, horario|
  fill_in 'instrutor[nome]', :with => nome
  fill_in 'instrutor[email]', :with => email
  fill_in 'instrutor[password]', :with => senha
  fill_in 'instrutor[endereco]', :with => endereco
  fill_in 'instrutor[cep]', :with => cep
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[data_nascimento]', :with => data
  fill_in 'instrutor[contato]', :with => contato
  fill_in 'instrutor[horario_trabalho]', :with => horario
end

When('eu clico no botao Editar Instrutor') do
  click_button 'Update Instrutor'
end

Then('eu vejo uma mensagem de sucesso dizendo que o instrutor foi editado') do
  expect(page).to have_content('Instrutor was successfully updated.')
end

Given('estou na pagina de visualizacao desse instrutor com cpf {string}') do |cpf|
  id = Instrutor.where(cpf: cpf).first.id
  visit "/instrutors/#{id}"
end

When('eu clico no botao Remover Instrutor') do
  click_button 'Destroy this instrutor'
end

Then('eu vejo uma mensagem de sucesso dizendo que o instrutor foi removido') do
  expect(page).to have_content('Instrutor was successfully destroyed.')
end
