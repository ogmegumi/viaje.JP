class MemosController < ApplicationController

  # def index 一人のユーザーが投稿すると全て情報取得するためshowへ移行
  #   # @memos = Memo.all
  #   # @memo = Memo.new
  #   # @user = current_user
  #   # @user = @memo.user
  # end

  def show
    @memos = Memo.where(id: params[:id])
    @memo = Memo.new
    @user = current_user
    @user = @memo.user
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    if @memo.save
       flash[:notice] = "You have created Task successfully"
       redirect_to user_memo_path(@memo.user_id, @memo.id)
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
       flash[:notice] = "You have updateed Task successfully"
       redirect_to user_memo_path(@memo.id, current_user)
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to user_memo_path(current_user)
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end
end
