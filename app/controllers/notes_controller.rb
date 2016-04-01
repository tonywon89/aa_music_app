class NotesController < ApplicationController
  before_action :require_log_in, only: [:create]
  before_action :ensure_author_of_delete, only: [:destroy]

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.save

    redirect_to track_url(@note.track)
  end

  def destroy
    @note = Note.find_by(id: params[:id])
    track = @note.track

    @note.destroy

    redirect_to track_url(track)
  end

  private
  def note_params
    params.require(:note).permit(:content, :track_id)
  end

  def require_log_in
    redirect_to new_session_url unless current_user
  end

  def ensure_author_of_delete
    render text: "You are not the author, you cannot delete the note", status: 403
  end
end
