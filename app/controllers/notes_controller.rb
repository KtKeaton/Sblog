class NotesController < ApplicationController
  before_action :note_params

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
      redirect_to "/note/new"
    end
  end

private

  def note_params
    params.permit(:title, :content)
  end

end
