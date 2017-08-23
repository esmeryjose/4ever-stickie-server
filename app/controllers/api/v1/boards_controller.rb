class Api::V1::BoardsController < ApplicationController
  before_action :set_board, only:[:show,:update]

  def index
    boards = Board.all
    render json: boards
  end

  def create
    board = Board.create(board_params)
    render json: board
  end

  def show
    render json: board
  end

  def update
    @board = Board.update(board_params)
    render json: @board
  end

  private

  def board_params
    params.require(:board).permit(:title, :user_id)
  end

  def set_board
    @board = Board.find_by(id: params[:id])
  end
end
