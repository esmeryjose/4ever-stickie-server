class Api::V1::NotesController < ApplicationController
  before_action :set_note, only:[:update]

  def create
    note = Note.create(note_params)
    now_render(note)
  end

  def update
    @note.update(note_params)
    now_render(@note)
  end

  private

  def note_params
    params.require(:note).permit(:content, :board_id)
  end

  def set_note
    @note = Note.find_by(id: params[:id])
  end

end
