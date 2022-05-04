class WarehousesController < ApplicationController
  def show
    id = params[:id]
    @warehouse = Warehouse.find(id)
  end

  def new
  end

  def create
    warehouse_params = params.require(:warehouse).permit(:name, :city, :city_code, :area,
                                                         :adress, :cep, :description)
    Warehouse.create(warehouse_params)
    redirect_to root_path
  end
end