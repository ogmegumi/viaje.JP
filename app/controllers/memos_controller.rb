class MemosController < ApplicationController
  before_action :authenticate_user!,except: [:top]

  def index
    @memos = Memo.where(user_id: current_user.id)  #userに紐づけることで他のuserが見れない
    @memo = Memo.new
    @user = current_user
    @user = @memo.user
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id #アソシエーション
    if @memo.save
       flash[:notice] = "You have created Task successfully"
       redirect_to user_memos_path(@memo.user_id)
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
       flash[:notice] = "You have updateed Task successfully"
       redirect_to user_memos_path(@memo.user_id)
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to user_memos_path(@memo.user_id)
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end
end
