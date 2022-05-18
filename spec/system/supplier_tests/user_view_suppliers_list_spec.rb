require 'rails_helper'

describe 'Usuário acessa os fornecedores' do
  it 'e vê a listas destes' do
    Supplier.create!(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                      adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                      cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')

    visit('/')
    click_on('Fornecedores')
    
    expect(page).to have_content('Fornecedor: Aligner')
    expect(page).to have_content('CNPJ: 40.949.406/0001-30')
    expect(page).to have_content('e-mail: contato_aligner@gmail.com')
    expect(page).not_to have_content 'Não há fornecedores'
  end
  
  it 'e volta para a home_view' do
    visit('/')
    click_on('Fornecedores')
    click_on('Galpões')

    expect(current_path).to eq('/')
  end
  
  it 'e não há fornecedores cadastrados' do
    visit('/')
    click_on('Fornecedores')

    expect(page).to have_content('Não há fornecedores')
  end

  it 'e vê os detalhes do fornecedor' do
    Supplier.create!(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                      adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                      cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')

    visit root_path
    click_on 'Fornecedores'
    click_on 'Aligner'

    expect(page).to have_content('Detalhes do fornecedor: Aligner')
    expect(page).to have_content('CNPJ: 40.949.406/0001-30')
    expect(page).to have_content('e-mail: contato_aligner@gmail.com')
    expect(page).to have_content('Razão social: ALIGNER COMERCIO DE CONFECCOES LTDA')
    expect(page).to have_content('Endereço: Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320')
    expect(page).to have_content('Telefone: (83) 3341-4263')
  end

end