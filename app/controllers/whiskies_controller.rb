class WhiskiesController < ApplicationController
  # before_action :authenticate_user!, except: [:index, :show]
  # before_action(:authorize, only: [:edit, :destroy, :update])
  def show
    @whisky = Whisky.find params[:id]

  end

  def index
    @whiskies = Whisky.all
  end

  def new
    @whisky = Whisky.new
  end


  def create
    @whisky = Whisky.new whisky_params
    @whisky.user = current_user
    if @whisky.save
      redirect_to whisky_path(@whisky)
      flash[:notice] = 'Whisky created successfully'
    else
      render :new
    end
  end

  def edit
    @whisky = Whisky.find params[:id]
  end

  def update
    @whisky = Whisky.find params[:id]
    if @whisky.update whisky_params
      redirect_to whisky_path(@whisky)
    else
      render :edit
    end
  end

  def destroy
    whisky = Whisky.find params[:id]
    whisky.destroy
    redirect_to whiskies_path
  end

  private

  def whisky_params
    params.require(:whisky).permit([:name, :distillery, :age, :cask, :kind, :abv, :price, :image])
  end

  def find_whisky
    @whisky = Whisky.find params[:id]
  end

  def authorize

    if cannot?(:manage, @whisky)
      redirect_to whiskies_path, alert: 'not authorized'
    end
  end
end
