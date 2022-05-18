require 'rails_helper'

describe 'Usuário deleta o galpão' do
  it 'e o faz com sucesso' do 
    Warehouse.create!(name: 'galpão-SP', city: 'Guarulhos', city_code: 'GRU', area: 100_000,
                          adress: 'Avenida Aeroporto, 1000', cep: '15000-000', 
                          description: 'Galpão do aeroporto de Guarulhos.')
    visit root_path
    click_on 'galpão-SP'
    click_on 'Deletar'

    expect(current_path).to eq root_path
    expect(page).to have_content 'Galpão deletado com sucesso.'
    expect(page).not_to have_content 'galpão-SP'
  end
end