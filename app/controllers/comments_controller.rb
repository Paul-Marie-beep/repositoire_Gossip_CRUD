class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:show, :new, :create]
  before_action :authenticate_comment_author, only: [:edit, :update, :destroy]






  def new
    @new_comment = Comment.new
  end

  def create
    @new_comment = Comment.new(content: params[:content])
    @new_comment.user = current_user
    @new_comment.potin = Potin.find(params[:potin_id])
    @gossip = Potin.find(params[:potin_id])
    if @new_comment.save
    redirect_to potin_path(params[:potin_id])
    end
  end

  def index
    
  end

  def edit
    @gos = Potin.find(params[:potin_id])
    @com = Comment.find(params[:id])
  end

  def update
    puts "$" * 60
    puts params
    puts "$" * 60
    @com = Comment.find(params[:id])
    @post_params = params.require(:com).permit(:content)

    if @com.update(@post_params)
      redirect_to potin_path(@gos.id)
    end


  end

  def destroy
    delete(@com)
    redirect_to potin_path(@gos.id)
  end

  private

  def authenticate_user #On vérifie que la personne est bien conncectée avant de l'autoriser à écrire un commentaire
    unless current_user
      flash[:danger] = "Merci de vous connecter"
      redirect_to new_session_path
    end
  end

  def authenticate_comment_author #Une personne ne peut modifier / détruire que ses propres commentaires
    @gos = Potin.find(params[:potin_id])
    unless current_user == @gos.user
      flash[:danger] = "Vous ne pouvez pas modifier ou supprimer un commentaire dont vous n'êtes pas l'auteur"
      redirect_to potin_path(@gos.id)
    end
  end


end
