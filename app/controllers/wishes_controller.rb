class WishesController < ApplicationController
  def create
   whisky = Whisky.find params[:whisky_id]
   wish = Wish.new(whisky: whisky, user: current_user)
   if wish.save
     redirect_to whisky_path(whisky)
   else
     redirect_to whisky_path(whisky), alert: 'A problem occurred'
   end
 end

 def destroy
   wish = Wish.find params[:id]
   wish.destroy
   redirect_to whisky_path(wish.whisky)
 end

 def index
   @user = User.find(params[:user_id])
   @whiskies = @user.favourited_auctions
 end
end
