Given('existe um proprietario com nome {string}, endereco {string}, cep {string}, cpf {string}, data_nascimento {string}, contato {string}, horario_trabalho {string}, email {string} e password {string}') do |nome, endereco, cep, cpf, data_nascimento, contato, horario_trabalho, email, password|
  visit '/users/sign_up'
  expect(page).to have_content 'Sign up'

  fill_in 'user[nome]', :with => nome
  fill_in 'user[endereco]', :with => endereco
  fill_in 'user[cep]', :with => cep
  fill_in 'user[cpf]', :with => cpf
  fill_in 'user[data_nascimento]', :with => data_nascimento
  fill_in 'user[contato]', :with => contato
  fill_in 'user[horario_trabalho]', :with => horario_trabalho
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => password
  fill_in 'user[password_confirmation]', :with => password

  click_button 'Sign up'
  expect(page).to have_content 'Welcome! You have signed up successfully'
end

Given('eu estou na pagina de cadastro de academia') do
  visit '/academia/new'
  expect(page).to have_content 'Criar Academia'
end

When('eu preencho os dados para o proprietario com cpf {string} os campos nome {string}, email {string}, endereco {string}, cnpj {string} e contato {string}') do |cpf, nome, email, endereco, cnpj, contato|
  id = User.where(cpf: cpf).first.id

  fill_in 'academia[id_proprietario]', :with => id
  fill_in 'academia[nome]', :with => nome
  fill_in 'academia[email]', :with => email
  fill_in 'academia[endereco]', :with => endereco
  fill_in 'academia[cnpj]', :with => cnpj
  fill_in 'academia[contato]', :with => contato
end

When('eu clico no botao Criar Academia') do
  click_button 'Criar Academia'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi criada') do
  expect(page).to have_content 'Academia was successfully created.'
end

Given('esse proprietario de cpf {string} tem academia que possui nome {string}, email {string}, endereco {string}, cnpj {string} e contato {string}') do |cpf, nome, email, endereco, cnpj, contato|
  visit '/academia/new'
  expect(page).to have_content 'Criar Academia'

  id = User.where(cpf: cpf).first.id

  fill_in 'academia[id_proprietario]', :with => id
  fill_in 'academia[nome]', :with => nome
  fill_in 'academia[email]', :with => email
  fill_in 'academia[endereco]', :with => endereco
  fill_in 'academia[cnpj]', :with => cnpj
  fill_in 'academia[contato]', :with => contato

  click_button 'Criar Academia'
  expect(page).to have_content 'Academia was successfully created.'
end

When('eu estou na pagina das minhas academias') do
  visit '/academia'
end

Then('eu visualizo a academia com cnpj {string}') do |cnpj|
  expect(page).to have_content cnpj
end

Given('eu visualizo a academia com cnpj {string}') do |cnpj|
  visit '/academia'
  expect(page).to have_content cnpj
end

When('eu clico no botao Ver Academia') do
  click_link 'Ver Academia'
end

Then('eu sou redirecionado para a pagina do perfil da academia com cnpj {string} onde eu posso ver seus dados') do |cnpj|
  expect(page).to have_content cnpj
end

Given('estou na pagina de edicao dessa academia com cnpj {string}') do |cnpj|
  id = Academia.where(cnpj: cnpj).first.id
  visit "/academia/edit/#{id}"

  expect(page).to have_content 'Editar Academia'
end

When('eu edito os campos com os novos valores nome {string}, email {string}, endereco {string}, cnpj {string} e contato {string}') do |nome, email, endereco, cnpj, contato|
  fill_in 'academia[nome]', :with => nome
  fill_in 'academia[email]', :with => email
  fill_in 'academia[endereco]', :with => endereco
  fill_in 'academia[cnpj]', :with => cnpj
  fill_in 'academia[contato]', :with => contato
end

When('eu clico no botao Editar Academia') do
  click_button 'Editar Academia'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi editada') do
  expect(page).to have_content 'Academia was successfully updated.'
end

Given('estou na pagina de visualizacao dessa academia com cnpj {string}') do |cnpj|
  id = Academia.where(cnpj: cnpj).first.id
  visit "/academia#{id}"

  expect(page).to have_content cnpj
end

When('eu clico no botao Remover Academia') do
  click_button 'Remover Academia'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi removida') do
  expect(page).to have_content 'Academia was successfully destroyed.'
end