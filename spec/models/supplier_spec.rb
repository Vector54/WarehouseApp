require 'rails_helper'

RSpec.describe Supplier, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'of everything' do
        supplier = Supplier.new(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
        
        b = supplier.valid?
        
        expect(b).to eq(true)
      end

      it 'of somethings' do
        supplier = Supplier.new(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: '',
                        cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '')
        
        b = supplier.valid?
        
        expect(b).to eq(true)
      end
      
      it 'but name' do
        supplier = Supplier.new(name: '', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
        
        b = supplier.valid?
        
        expect(b).to eq(false)
      end

      it 'but corporate name' do
        supplier = Supplier.new(name: 'Aligner', corporate_name: '', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
        
        b = supplier.valid?
        
        expect(b).to eq(false)
      end

      it 'but cnpj' do
        supplier = Supplier.new(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
        
        b = supplier.valid?
        
        expect(b).to eq(false)
      end

      it 'but email' do
        supplier = Supplier.new(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '40.949.406/0001-30', email: '', phone: '(83) 3341-4263')
        
        b = supplier.valid?
        
        expect(b).to eq(false)
      end
      
    end
    
    it 'uniqueness of cnpj' do
      Supplier.create!(name: 'Aligner', corporate_name: 'ALIGNER COMERCIO DE CONFECCOES LTDA', 
                        adress: 'Rua Sebastiao Donato, 25; Loja 106; SAO JOSE; CAMPINA GRANDE - PB; 58400-320',
                        cnpj: '40.949.406/0001-30', email: 'contato_aligner@gmail.com', phone: '(83) 3341-4263')
      
      supplier = Supplier.new(name: 'Something', corporate_name: 'Something else', 
                        adress: 'Another thing',
                        cnpj: '40.949.406/0001-30', email: 'Yet something else', phone: 'Imagine numbers here')

      b = supplier.valid?
      
      expect(b).to eq(false)
    end   
  end
end
