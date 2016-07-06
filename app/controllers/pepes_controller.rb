class PepesController < ApplicationController
  before_action :set_pepe, only: [:show, :destroy]

  def index
    if params[:user]
      @pepes = Pepe.where(user: params[:user])
    else
      @pepes = Pepe.all.order(created_at: :desc)
    end
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
  end

  def destroy
    authorize @pepe
    @pepe.destroy
    redirect_to pepes_path(user: current_user), notice: 'Pepe was successfully disowned.'
  end

  private

  def set_pepe
    @pepe = Pepe.find(params[:id])
  end

  def pepe_params
    params.require(:pepe).permit(:title, :description, :image)
  end
end
