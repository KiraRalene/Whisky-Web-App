class NotesController < ApplicationController
  before_action(:authorize, only: [:edit, :destroy, :update])
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @note = Note.new
  end

  def create
    @whisky = Whisky.find params[:whisky_id]
    @note = Note.new note_params
    @note.user = current_user
    @note.whisky = @whisky
    @note.rating = Rating.new
    @note.rating.whisky = @whisky
    @note.rating.score = params[:note] [:rating]
    # @note.rating.score = params[:note][:rating].to_i
    if @note.save
      redirect_to note_path(@note), notice: 'Note created!'
    else
      flash.now[:alert] = 'Please fix errors below'
      render :new
    end
  end

  def destroy
    note = Note.find params[:id]
    note.destroy
    redirect_to post_path(params[:post_id]), notice: 'note deleted'
  end

  def show
    @note = Note.find params[:id]
  end

  private
  def note_params
    params.require(:note).permit([:color, :nose, :palate, :description, :price])
  end
end
