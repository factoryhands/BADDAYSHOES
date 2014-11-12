class ShoesController < ApplicationController

  def index
    @shoes = Shoe.get_active_sales
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def new
    @shoe = Shoe.new
  end

  def create
    @shoe = Shoe.new(shoe_params)

    if @shoe.save
      redirect_to @shoe
    else
      render :new
    end
  end

  def edit
    @shoes = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])

    if @shoe.update(shoe_params)
      redirect_to @shoe
    else
      render :edit
    end
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
    redirect_to root_path, notice: 'Shoes deleted'
  end

private

  def shoe_params
    params.require(:shoes).permit(:name, :brand, :price, :link)
  end
end
