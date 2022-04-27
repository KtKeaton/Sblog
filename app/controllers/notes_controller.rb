class NotesController < ApplicationController
  before_action :find_user_note, only: [:show, :edit, :update, :destroy]
  before_action :check_login!, except: [:index, :show]

  def index
    @notes = current_user.notes.includes(:user).order(id: :desc)
  end

  def new
    # if not user_signed_in?
    #   redirect_to login_path
    # end
    @note = current_user.notes.new
  end

  def create
    # @note = Note.new(note_params)
    # @note.user_id = current_user.id
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to "/notes"
    else
      redirect_to "/notes/new"
    end
  end

  def show
    # 顯示所有文章，擺脫 current_user
    # @note = Note.find(params[:id])
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
  def find_user_note
    # begin
      # @note = Note.find_by(id: params[:id], user_id: current_user.ud)
        @note = current_user.notes.find(params[:id])
    # rescue ActiveRecord::RecordNotFound
    #   #render file: "public/404.html", status: 404
    # end
  end


  def note_params
    params.require(:note).permit(:title, :content)
  end

end
