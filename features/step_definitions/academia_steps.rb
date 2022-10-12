Given('existe um proprietario com nome {string}, endereco {string}, cep {string}, cpf {string}, data_nascimento {string}, contato {string}, email {string} e password {string}') do |nome, endereco, cep, cpf, data_nascimento, contato, email, password|
  visit '/proprietarios/sign_up'
  expect(page).to have_content 'Sign up'

  fill_in 'proprietario[nome]', :with => nome
  fill_in 'proprietario[endereco]', :with => endereco
  fill_in 'proprietario[cep]', :with => cep
  fill_in 'proprietario[cpf]', :with => cpf
  fill_in 'proprietario[data_nascimento]', :with => data_nascimento
  fill_in 'proprietario[contato]', :with => contato
  fill_in 'proprietario[email]', :with => email
  fill_in 'proprietario[password]', :with => password
  fill_in 'proprietario[password_confirmation]', :with => password

  click_button 'Sign up'
  expect(page).to have_content 'Welcome! You have signed up successfully'
end

Given('eu estou na pagina de cadastro de academia') do
  visit '/academia/new'
  expect(page).to have_content 'New academium'
end

When('eu preencho os dados para o proprietario com cpf {string} os campos nome {string}, email {string}, endereco {string}, cep {string}, cnpj {string} e contato {string}') do |cpf, nome, email, endereco, cep, cnpj, contato|
  id = Proprietario.where(cpf: cpf).first.id

  fill_in 'academium[nome]', :with => nome
  fill_in 'academium[email_comercial]', :with => email
  fill_in 'academium[endereco_attributes][logradouro]', :with => endereco
  fill_in 'academium[endereco_attributes][cep]', :with => cep
  fill_in 'academium[cnpj]', :with => cnpj
  fill_in 'academium[contato_comercial]', :with => contato
  find("#academium_proprietario_id option[value='#{id}']").select_option
end

When('eu clico no botao Criar Academia') do
  click_button 'Create Academium'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi criada') do
  expect(page).to have_content 'Academium was successfully created.'
end

Given('esse proprietario de cpf {string} tem academia que possui nome {string}, email {string}, endereco {string}, cep {string}, cnpj {string} e contato {string}') do |cpf, nome, email, endereco, cep, cnpj, contato|
  visit '/academia/new'
  expect(page).to have_content 'New academium'

  id = Proprietario.where(cpf: cpf).first.id

  find("#academium_proprietario_id option[value='#{id}']").select_option
  fill_in 'academium[nome]', :with => nome
  fill_in 'academium[email_comercial]', :with => email
  fill_in 'academium[endereco_attributes][logradouro]', :with => endereco
  fill_in 'academium[endereco_attributes][cep]', :with => cep
  fill_in 'academium[cnpj]', :with => cnpj
  fill_in 'academium[contato_comercial]', :with => contato

  click_button 'Create Academium'
  expect(page).to have_content 'Academium was successfully created.'
end

When('eu estou na pagina das minhas academias') do
  visit '/academia'
end

Then('eu visualizo a academia com cnpj {string}') do |cnpj|
  expect(page).to have_content cnpj
end

Given('eu visualizo a academia com cnpj {string} na pagina de academias') do |cnpj|
  visit '/academia'
  expect(page).to have_content cnpj
end

When('eu clico no botao Ver Academia da academia com cnpj {string}') do |cnpj|
  id = Academium.where(cnpj: cnpj).first.id
  find("a[href='/academia/#{id}']").click
end

Then('eu sou redirecionado para a pagina do perfil da academia com cnpj {string} onde eu posso ver seus dados') do |cnpj|
  expect(page).to have_content cnpj
end

Given('estou na pagina de edicao dessa academia com cnpj {string}') do |cnpj|
  id = Academium.where(cnpj: cnpj).first.id
  visit "/academia/#{id}/edit"

  expect(page).to have_content 'Editing academium'
end

When('eu edito os campos com os novos valores nome {string}, email {string}, endereco {string}, cep {string}, cnpj {string} e contato {string}') do |nome, email, endereco, cep, cnpj, contato|
  fill_in 'academium[nome]', :with => nome
  fill_in 'academium[email_comercial]', :with => email
  fill_in 'academium[endereco_attributes][logradouro]', :with => endereco
  fill_in 'academium[endereco_attributes][cep]', :with => cep
  fill_in 'academium[cnpj]', :with => cnpj
  fill_in 'academium[contato_comercial]', :with => contato
end

When('eu clico no botao Editar Academia') do
  click_button 'Update Academium'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi editada') do
  expect(page).to have_content 'Academium was successfully updated.'
end

Given('estou na pagina de visualizacao dessa academia com cnpj {string}') do |cnpj|
  id = Academium.where(cnpj: cnpj).first.id
  visit "/academia/#{id}"

  expect(page).to have_content cnpj
end

When('eu clico no botao Remover Academia') do
  click_button 'Deletar'
end

Then('eu vejo uma mensagem de sucesso dizendo que a academia foi removida') do
  expect(page).to have_content 'Academium was successfully destroyed.'
end