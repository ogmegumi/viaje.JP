class HomesController < ApplicationController
    before_action :authenticate_user!,except: [:top]

   def top
   end

   def unsubscribe
     @user = current_user
   end

   def withdraw
     user = current_user
     user.update(unsubscribe: true)
     reset_session
     flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
     redirect_to root_path
   end
  end
