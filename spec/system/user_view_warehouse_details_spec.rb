require 'rails_helper'

describe 'Usuário aperta no galpão' do
  it 'e vê os detalhes' do
    Warehouse.create(name: 'galpão-SP', city: 'Guarulhos', city_code: 'GRU', area: 100_000,
                      adress: 'Avenida Aeroporto, 1000', cep: '15000-000', 
                      description: 'Galpão do aeroporto de Guarulhos.')

    visit('/')
    click_on('galpão-SP')
    
    expect(page).to have_content('galpão-SP')
    expect(page).to have_content('Cidade: Guarulhos')
    expect(page).to have_content('Código: GRU')
    expect(page).to have_content('Área: 100000 m²')
    expect(page).to have_content('Endereço: Avenida Aeroporto, 1000 ; CEP: 15000-000')
    expect(page).to have_content('Descrição: Galpão do aeroporto de Guarulhos.')

  end
end