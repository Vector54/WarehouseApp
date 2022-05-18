require 'rails_helper'

describe 'Usuário quer editar um galpão' do
  it 'e vê a página de edição' do
    Warehouse.create!(name: 'galpão-SP', city: 'Guarulhos', city_code: 'GRU', area: 100_000,
                          adress: 'Avenida Aeroporto, 1000', cep: '15000-000', 
                          description: 'Galpão do aeroporto de Guarulhos.')

    visit root_path
    click_on 'galpão-SP'
    click_on 'Editar Galpão'

    expect(page).to have_content('Editar Galpão')
    expect(page).to have_field('Nome', with: 'galpão-SP')
  end

  it 'e o faz com sucesso' do 
    w = Warehouse.create!(name: 'galpão-SP', city: 'Guarulhos', city_code: 'GRU', area: 100_000,
                          adress: 'Avenida Aeroporto, 1000', cep: '15000-000', 
                          description: 'Galpão do aeroporto de Guarulhos.')

    visit root_path
    click_on 'galpão-SP'
    click_on 'Editar Galpão'
    fill_in 'Nome', with: 'Galpão-SP'
    click_on 'Enviar'

    expect(page).to have_content('Galpão atualizado com sucesso')
    expect(page).to have_content('Detalhes do galpão: Galpão-SP')
  end

  it 'e falha ao fazê-lo' do 
    w = Warehouse.create!(name: 'galpão-SP', city: 'Guarulhos', city_code: 'GRU', area: 100_000,
                          adress: 'Avenida Aeroporto, 1000', cep: '15000-000', 
                          description: 'Galpão do aeroporto de Guarulhos.')

    visit root_path
    click_on 'galpão-SP'
    click_on 'Editar Galpão'
    fill_in 'Código', with: 'GR'
    click_on 'Enviar'

    expect(page).to have_content('Falha na atualização')
  end
end