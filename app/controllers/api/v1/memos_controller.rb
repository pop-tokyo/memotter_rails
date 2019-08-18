class Api::V1::MemosController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @memos = Memo.order(id: :desc)
    render json: @memos
  end

  def show
    @memo = Memo.find(params[:id])
    render json: @memo
  end

  def create
    @memo = current_user.memos.build(memo_params)

    if @memo.save
      render json: @memo, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  def update
    @memo = current_user.memos.find(params[:id])
    @memo.assign_attributes(memo_params)

    if @memo.save
      render json:@memo
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @memo = current_user.memos.find(params[:id])
    @memo.destroy
  end

  private
  def memo_params
    # TODO Memoモデルの:editカラムは必要？
    params.require(:memo).permit(:content)
  end
end
