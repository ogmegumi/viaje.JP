class MemosController < ApplicationController

  def index
    @memos = Memo.all
    @memo = Memo.new
    @user = current_user
    @user = @memo.user
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.user_id = current_user.id
    if @memo.save
       flash[:notice] = "You have created Task successfully"
       redirect_to user_memos_path
    end
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
       flash[:notice] = "You have updateed Task successfully"
       redirect_to memos_path
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to memos_path
  end

  private

  def memo_params
    params.require(:memo).permit(:memo)
  end
end
