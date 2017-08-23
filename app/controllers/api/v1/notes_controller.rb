class Api::V1::NotesController < ApplicationController
  before_action :set_note, only:[:update]

  def index
    notes = Note.all
    render json: notes
  end

  def create
    note = Note.create(note_params)
    render json: note
  end

  def update
    @note.update(note_params)
    render json: @note
  end

  private

  def note_params
    params.require(:note).permit(:content, :board_id)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end
end
