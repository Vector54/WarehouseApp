require 'rails_helper'

describe 'Usuário quer registrar um galpão' do
  it 'e entra na página de registro' do
    visit root_path
    click_on 'Cadastrar Galpão'

    expect(page).to have_field('Cidade')
    expect(page).to have_field('Código')
    expect(page).to have_field('Nome')
    expect(page).to have_field('Área')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Descrição')
  end

  it 'e realiza o cadastro' do 
    visit root_path
    click_on 'Cadastrar Galpão'
    fill_in "Nome", with: "Galpão-CG"
    fill_in "Cidade", with: "Campina Grande"
    fill_in "Código", with: "CPZ"
    fill_in "Área", with: '18000'
    fill_in "Endereço", with: "Avenida Floriano Peixoto, 7000"
    fill_in "CEP", with: "58000-525"
    fill_in "Descrição", with: "Galpão destinado à distribuição de CUZCUiZ."
    click_on 'Enviar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('CPZ')
  end
end