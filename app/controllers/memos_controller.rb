class MemosController < ApplicationController

  def index
    @memos = Memo.all
    @memo = Memo.new
  end

  def create
    @memo = Memo.new(memo_params)
    @memo.save
    redirect_to memos_path
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.update(memo_params)
    redirect_to memos_path
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
