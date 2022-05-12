class WarehousesController < ApplicationController
  before_action :set_warehouse, only: %i[show edit update destroy]

  def show; end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_attributes)

    if @warehouse.save
      flash[:success] = 'Galpão cadastrado com sucesso!'
      redirect_to @warehouse
    else
      flash.now[:error] = 'Dados incompletos...'
      render 'new'
    end
  end

  def edit; end

  def update
    if @warehouse.update(warehouse_attributes)
      flash[:success] = 'Galpão atualizado com sucesso!'
      redirect_to @warehouse
    else
      flash.now[:error] = 'Não foi possível atualizar o galpão...'
      render 'edit'
    end
  end

  def destroy
    @warehouse.destroy
    flash[:success] = 'Galpão removido com sucesso!'
    redirect_to root_path
  end

  private

  def set_warehouse
    @warehouse = Warehouse.find(params[:id])
  end

  def warehouse_attributes
    params.require(:warehouse).permit(:name, :description, :code, :address,
                                      :city, :state, :postal_code, :area)
  end
end
