require 'rails_helper'

describe 'Usuário vê a tela inicial' do
  it 'e vê o nome do app' do
    visit('/')

    expect(page).to have_content('Galpões & Estoque')
  end

  it 'e vê os galpões cadastrados' do 
		Warehouse.create(city: 'Rio de Janeiro', city_code: 'SDU', name: 'Rio', area: 50_000 )
		Warehouse.create(city: 'Maceió', city_code: 'MCZ', name: 'Maceió', area: 60_000 )

		visit('/')

		expect(page).not_to have_content('Não há galpões cadastrados.')

		expect(page).to have_content('Cidade: Rio de Janeiro')
		expect(page).to have_content('Código: SDU')
		expect(page).to have_content('Rio')
		expect(page).to have_content('50000 m²')

		expect(page).to have_content('Cidade: Maceió')
		expect(page).to have_content('Código: MCZ')
		expect(page).to have_content('Maceió')
		expect(page).to have_content('60000 m²')
	end
	
	it 'e não há galpões cadastrados.' do
		visit('/')

		expect(page).to have_content('Não há galpões cadastrados.')
	end
end