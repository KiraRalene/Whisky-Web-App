class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_like, only: [:destroy]
  before_action :find_note, only: [:create]

  def create
    if cannot? :like, @note
      redirect_to note_path(@note), alert:"Really your want to like your own note?"
      return
    end

    like = Like.new(user: current_user, note: @note)

    if like.save
      redirect_to note_path(@note), notice: "Thanks for liking"
    else
      redirect_to note_path(@note), notice: "Can't Like"
    end
  end

  def destroy
    if cannot? :like, @like.note
      redirect_to note_path(@like.note), alert: 'how are you unliking your own question?'
      return
    end

    redirect_to(
      note_path(@like.note),
      @like.destroy ? {notice: 'Like removed!'} : {alert: @likes.errors.full_messages.join(", ")}
    )
  end

  private

  def find_like
    @like ||= Like.find(params[:id])
  end

  def find_note
    @note ||= Post.find(params[:note_id])
  end
end
