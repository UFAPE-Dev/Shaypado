Given('Eu estou na pagina de alunos') do
  visit '/alunos'
  expect(page).to have_content 'Alunos'
end

When('Eu clico em adicionar aluno') do
  click_link 'New aluno'
  expect(page).to have_content 'New aluno'
end

And('Eu preencho o formulario com os dados do aluno') do
  fill_in 'aluno[nome]', with: 'Nome do Aluno'
  fill_in 'aluno[endereco]', with: 'Endereço do Aluno'
  fill_in 'aluno[cep]', with: '55385000'
  fill_in 'aluno[cpf]', with: '12345678522'
  fill_in 'aluno[data_nascimento]', with: '09-06-2001'
  fill_in 'aluno[contato]', with: '87981067233'
  fill_in 'aluno[senha]', with: '12345678'
end

And('Eu clico em salvar') do
  click_button 'Create Aluno'
end

And('Eu vejo uma mensagem de sucesso') do
  expect(page).to have_content('Aluno was successfully created.')
end

Then('Eu vejo o aluno {string} na lista de alunos') do |nome|
  expect(page).to have_content(nome)
end

And('a academia com nome {string} e cnpj {string} existe') do |nome, cnpj|
  visit '/academia/new'
  fill_in 'academium[nome]', with: nome
  fill_in 'academium[cnpj]', with: cnpj
  fill_in 'academium[contato]', with: '87981067233'
  fill_in 'academium[email]', with: 'email@email.com'
  fill_in 'academium[endereco]', with: 'Endereço da academia'

  click_button 'Create Academium'
  expect(page).to have_content(nome)
end

Given('o proprietario com email {string} e senha {string} esta logado') do |email, senha|
  visit '/proprietarios/sign_up'
  fill_in 'proprietario[nome]', :with => "Usuario Teste"
  fill_in 'proprietario[endereco]', :with => "Test de endereco"
  fill_in 'proprietario[cep]', :with => "55385000"
  fill_in 'proprietario[cpf]', :with => "12345678900"
  fill_in 'proprietario[data_nascimento]', :with => "09/01/2001"
  fill_in 'proprietario[contato]', :with => "21547896322"
  fill_in 'proprietario[email]', :with => email
  fill_in 'proprietario[password]', :with => senha
  fill_in 'proprietario[password_confirmation]', :with => senha

  click_button 'Sign up'
  expect(page).to have_content 'Welcome! You have signed up successfully'
end

And('Eu preencho os dados do aluno com nome {string} e cpf {string} e senha {string} e contato {string} e data de nascimento {string} e endereco {string} cep {string}') do |nome, cpf, senha, contato, data_nascimento, endereco, cep|
  fill_in 'aluno[nome]', :with => nome
  fill_in 'aluno[endereco]', :with => endereco
  fill_in 'aluno[cep]', :with => cep
  fill_in 'aluno[cpf]', :with => cpf
  fill_in 'aluno[data_nascimento]', :with => data_nascimento
  fill_in 'aluno[contato]', :with => contato
  fill_in 'aluno[senha]', :with => senha
end

When('Eu visito a pagina de editar aluno') do
  visit '/alunos/'+ Aluno.last.id.to_s + '/edit'
  expect(page).to have_content 'Editing aluno'
end

When('Eu clico em salvar aluno') do
  click_button 'Update Aluno'
end

Then('Eu vejo uma mensagem de que o aluno foi atualizado com sucesso') do
  expect(page).to have_content('Aluno was successfully updated.')
end

When('Eu visito a pagina de aluno') do
  visit '/alunos/'+ Aluno.last.id.to_s
  expect(page).to have_content Aluno.last.nome
end

When('Eu clico em remover aluno') do
  click_button 'Destroy this aluno'
end

Then('Eu vejo uma mensagem de que o aluno foi removido com sucesso') do
  expect(page).to have_content('Aluno was successfully destroyed.')
end

