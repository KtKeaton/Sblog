class NotesController < ApplicationController
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.order(id: :desc)
    
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

  def show
    
  end

  def edit
 
  end

  def update   
    if @note.update(note_params)
      redirect_to "/notes"
    else
      render :edit
    end
  end

  def destroy
    # @note.destroy
    @note.update(deleted_at: Time.now)
    redirect_to "/notes"
  end


private
  def find_note
    # begin
      @note = Note.find(params[:id])  
    # rescue ActiveRecord::RecordNotFound
    #   #render file: "public/404.html", status: 404
    # end
  end


  def note_params
    params.require(:note).permit(:title, :content)
  end

end
