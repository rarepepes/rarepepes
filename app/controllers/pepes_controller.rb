class PepesController < ApplicationController
  def index
    @pepes = Pepe.all.order(created_at: :desc)
  end

  def new
    @pepe = Pepe.new
    authorize @pepe
  end

  def create
    @pepe = Pepe.create(pepe_params)
    @pepe.user = current_user

    authorize @pepe

    if @pepe.save
      redirect_to @pepe, notice: 'Pepe was successfully created.'
    else
      render :new
    end
  end

  def show
    @pepe = Pepe.find params[:id]
  end

  private

  def pepe_params
    params.require(:pepe).permit(:title, :description, :image)
  end
end
