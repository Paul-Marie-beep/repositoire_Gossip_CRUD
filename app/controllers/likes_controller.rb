class LikesController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]


  def new
    @new_like = Like.new
  end

  def create
    @new_like = Like.new(potin: Potin.find_by(params[:id]), comment: Comment.find_by(params[:potin_id]))
    @new_like.user = current_user
    if @new_like.save
      redirect_to potin_path(@gos.id)
    end

    
  end

  def show
  end



  private

  def authenticate_user #On vérifie que la personne est bien conncectée avant de l'autoriser à écrire un commentaire
    unless current_user
      flash[:danger] = "Merci de vous connecter"
      redirect_to new_session_path
    end
  end

end
