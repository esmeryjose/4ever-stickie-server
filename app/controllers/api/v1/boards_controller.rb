class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only:[:show,:update]

  def index
    id = current_user_id
    boards = Board.my_boards(id).most_recent
    render json: boards
  end

  def create
    board = Board.create(board_params)
    now_render(board)
  end

  def show
    render json: @board
  end

  def update
    @board.update(board_params)
    now_render(@board)
  end

  private

  def board_params
    params.require(:board).permit(:title, :user_id)
  end

  def set_board
    @board = Board.find_by(id: params[:id])
  end
end
