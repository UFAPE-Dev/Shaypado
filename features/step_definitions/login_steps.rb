Given('eu estou na pagina de cadastro') do
  visit '/users/sign_up'
  expect(page).to have_content 'Sign up'
end

And('preencho meu email {string} e senha {string}') do |email, senha|
  fill_in 'user[nome]', :with => "Usuario Teste"
  fill_in 'user[endereco]', :with => "Test de endereco"
  fill_in 'user[cep]', :with => "55385000"
  fill_in 'user[cpf]', :with => "12345678900"
  fill_in 'user[data_nascimento]', :with => "09/01/2001"
  fill_in 'user[contato]', :with => "21547896322"
  fill_in 'user[horario_trabalho]', :with => "08:10"
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
  fill_in 'user[password_confirmation]', :with => senha
end

And('eu clico no botao Sign Up') do
  click_button 'Sign up'

  expect(page).to have_content 'Welcome! You have signed up successfully'
end

Then('eu vejo a mensagem {string}') do |message|
  expect(page).to have_content message
end

Given('eu estou na pagina de login') do
  visit '/users/sign_in'
  expect(page).to have_content 'Log in'
end

When('eu preencho o campo email com {string} e senha {string}') do |email, senha|
  fill_in 'user[email]', :with => email
  fill_in 'user[password]', :with => senha
end

And('eu clico no botao Log in') do
  click_button 'Log in'
end

And('eu faco logout') do
  click_on 'Logout'
  expect(page).to have_content 'Bem vindo ao Rails no Heroku'
end