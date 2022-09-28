Given ('eu estou na pagina de cadastro') do
  visit '/intrutor/new'
  expect(page).to have_content 'new instrutor'
end

When ('eu preencho os campos de nome {string}, cpf {string}, email {string}, senha {string}' ) do |nome, cpf, email, senha|
  fill_in 'instrutor[nome]', :with => nome
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[email]', :with => email
  fill_in 'instrutor[senha]', :with => senha
end

When ('eu clico em cadastrar novo instrutor') do
  click_button 'Create Instrutor'
end

Then ('eu vejo uma mensagem que o instrutor foi cadastrado com sucesso') do
  expect(page).to have_content('Instrutor was successfully created.')
end

Given ('o instrutor com CPF {string} existe') do |cpf|
  fill_in 'instrutor[nome]', :with => 'Rodrigo Andrade'
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[email]', :with => 'rodrigo@andrade.com'
  fill_in 'instrutor[senha]', :with => '123456'
  fill_in 'instrutor[senha_confirmation]', :with => '123456'
  click_button 'Create Instrutor'
  expect(page).to have_content(cpf)
end

When ('eu estou na pagina de instrutores') do
  visit '/instrutor'
  expect(page).to have_content('Instrutores')
end

Then ('eu vejo o instrutor com CPF {string}') do |cpf|
  expect(page).to have_content(cpf)
end

Given ('o instrutor com CPF {string} existe') do  |cpf|
  fill_in 'instrutor[nome]', :with => 'Rodrigo Andrade'
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[email]', :with => 'rodrigo@andrade.com'
  fill_in 'instrutor[senha]', :with => '123456'
  click_button 'Create Instrutor'
  expect(page).to have_content(cpf)
end

When ('eu clico em mostrar o instrutor com CPF {string}') do |cpf|
  click_button 'Show this instrutor'
end

Then ('eu vejo os dados do instrutor com CPF {string}') do |cpf|
  expect(page).to have_content(cpf)
end

Given ('o instrutor com CPF {string} existe') do |cpf|
  fill_in 'instrutor[nome]', :with => 'Rodrigo Andrade'
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[email]', :with => 'rodrigo@andrade.com'
  fill_in 'instrutor[senha]', :with => '123456'
  click_button 'Create Instrutor'
  expect(page).to have_content(cpf)
end

When ('eu clico em remover o instrutor com CPF {string}') do |cpf|
  click_button 'Destroy'
end

Then ('eu vejo uma mensagem que o instrutor foi removido com sucesso') do
  expect(page).to have_content('Instrutor was successfully destroyed.')
end

Given ('o instrutor com CPF {string} existe') do |cpf|
  fill_in 'instrutor[nome]', :with => 'Rodrigo Andrade'
  fill_in 'instrutor[cpf]', :with => cpf
  fill_in 'instrutor[email]', :with => 'rodrigo@andrade.com'
  fill_in 'instrutor[senha]', :with => '123456'
  click_button 'Create Instrutor'
  expect(page).to have_content(cpf)
end

When ('eu clico em editar o instrutor com CPF {string}') do |cpf|
  click_button 'Edit'
end

Then ('eu vejo uma mensagem que o instrutor foi editado com sucesso') do
  expect(page).to have_content('Instrutor was successfully updated.')
end

