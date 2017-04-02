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
    @note = Note.find_by_id[:id]
  end
end
