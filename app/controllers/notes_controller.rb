class NotesController < ApplicationController

  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    
    if @note.save
      redirect_to "/notes"
    else
      redirect_to "/notes/new"
    end
  end

private
  def note_params
    params.require(:note).permit(:title, :content)
  end

end
