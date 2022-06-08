class SuppliersController < ApplicationController
  def index 
    @supplierlist = Supplier.all    
  end 

  def show
    id = params[:id]
    @supplier = Supplier.find(id)
  end

  def new
    @supplier = Supplier.new
  end

  def create
    supplier_params = params.require(:supplier).permit(:name, :corporate_name, :cnpj,
                                                      :email, :adress, :phone)
    @supplier = Supplier.new(supplier_params)
    
    if @supplier.save()
      redirect_to suppliers_path, notice: 'Fornecedor cadastrado com sucesso.'
    else
      flash.now[:notice] = 'Falha ao cadastrar o fornecedor.'
    end
  end
end   