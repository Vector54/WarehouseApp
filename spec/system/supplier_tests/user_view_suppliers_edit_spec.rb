require 'rails_helper'

describe 'Usuário vai editar um galpão' do
  
  it 'e vê o formulário de edição' do
    Supplier.create!(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                      adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                      cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
    visit root_path
    click_on 'Fornecedores'
    click_on 'Aligner'
    click_on 'Editar'

    expect(page).to have_field 'Nome'
    expect(page).to have_field 'Razão social'
    expect(page).to have_field 'CNPJ'
    expect(page).to have_field 'e-mail'
    expect(page).to have_field 'Endereço'
    expect(page).to have_field 'Telefone'
  end

  it 'e edita com sucesso' do
    Supplier.create!(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                      adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                      cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
    visit root_path
    click_on 'Fornecedores'
    click_on 'Aligner'
    click_on 'Editar'
    fill_in 'Nome', with: 'Outro nome'
    fill_in 'e-mail', with: 'outro_email@gmail.com'
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor atualizado com sucesso.'
    expect(current_page).to eq supplier_path(Supplier.last.id)
  end
end