class WarehousesController < ApplicationController
  def show
    @warehouse = Warehouse.find(params[:id])
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    attributes = params.require(:warehouse).permit(:name, :description, :code, :address, :city, :cep, :area)
    @warehouse = Warehouse.new(attributes)

    if @warehouse.save
      flash[:success] = 'Galpão cadastrado com sucesso!'
      redirect_to @warehouse
    else
      flash.now[:error] = 'Dados incompletos...'
      render 'new'
    end
  end
end
