class Api::V1::MemosController < Api::V1::ApplicationController
  def index
    @memos = Memo.order(id: :desc)
    render json: @memos
  end

  def show
    @memo = Memo.find(params[:id])
    render json: @memo
  end

  def create
    @memo = Memo.new(memo_params)

    # TODO ユーザ認証機能を作ったら消す
    @memo.user_id = 1

    if @memo.save
      render json: @memo, status: :created
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  def update
    @memo = Memo.find(params[:id])
    @memo.assign_attributes(memo_params)

    if @memo.save
      render json:@memo
    else
      render json: @memo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @memo = Memo.find(params[:id])
    @memo.destroy
  end

  private
  def memo_params
    # TODO Memoモデルの:editカラムは必要？
    params.require(:memo).permit(:content)
  end
end
