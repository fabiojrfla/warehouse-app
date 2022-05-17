class SuppliersController < ApplicationController
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(params.require(:supplier).permit(:corporate_name, :brand_name, :registration_number,
                                                              :address, :city, :state, :postal_code, :email,
                                                              :phone_number))
    if @supplier.save
      flash[:success] = 'Fornecedor cadastrado com sucesso!'
      redirect_to @supplier
    else
      flash[:error] = 'Dados incompletos...'
      render 'new'
    end
  end
end
