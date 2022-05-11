require 'rails_helper'

RSpec.describe Warehouse, type: :model do
	describe "#valid?" do
		context 'presence' do
			it "false quando faltar o nome" do 
				w = Warehouse.new(name:'', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar a cidade" do 
				w = Warehouse.new(name:'Galpão - CG', city:'', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar o código" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar a área" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'CPZ', area:'', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar o endereço" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar o CEP" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it "false quando faltar a descrição" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'')

				r = w.valid?

				expect(r).to eq false
			end

			it "true quando tiver tudo" do 
				w = Warehouse.new(name:'Galpão - CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq true
			end
		end

		context 'detalhes' do
			it 'nome existente na db' do
				Warehouse.create(name:'Galpão-CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				w = Warehouse.new(name:'Galpão-CG', city:'Campina Grande', city_code:'NIL', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it 'código existente na db' do
				Warehouse.create(name:'Galpão-CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				w = Warehouse.new(name:'Galpão-outro', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

			it 'cep inválido' do
				w = Warehouse.new(name:'Galpão-CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq false
			end

      it 'cep válido' do
				w = Warehouse.new(name:'Galpão-CG', city:'Campina Grande', city_code:'CPZ', area:'18000', 
				adress:'Avenida Floriano Peixoto', cep:'58000-525', 
				description:'Galpão destinado à distribuição de CUZCUiZ.')

				r = w.valid?

				expect(r).to eq true
      end
		end
	end
end
