require 'rails_helper'

describe 'Usuário vai cadastrar um fornecedor' do
  
  it 'e acessa tela de cadastro' do
    visit('/')
    click_on('Fornecedores')
    click_on('Cadastrar novo fornecedor.')

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Razão social'
    expect(page).to have_field 'CNPJ'
    expect(page).to have_field 'e-mail'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Telefone'
  end
  
  it 'e o faz com sucesso' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor.'
    fill_in 'Nome', with: 'Aligner'
    fill_in 'Razão social', with: 'ALIGNER COMERCIO DE CONFECCOES LTDA'
    fill_in 'CNPJ', with: '40.949.406/0001-30'
    fill_in 'e-mail', with: 'contato_aligner@gmail.com'
    fill_in 'Endereço', with: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320'
    fill_in 'Telefone', with: '(83) 3341-4263'
    click_on 'Enviar'

    expect(page).to have_content 'Aligner'
    expect(page).to have_content 'contato_aligner@gmail.com'
    expect(page).to have_content 'Fornecedor cadastrado com sucesso.'
  end
end