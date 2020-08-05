class CommentsController < ApplicationController
  
  def new
    @new_comment = Comment.new

  end

  def create
    @new_comment = Comment.new(content: params[:content])
    @new_comment.user = User.first
    @new_comment.potin = Potin.find(params[:potin_id])
    @gossip = Potin.find(params[:potin_id])
    if @new_comment.save
    redirect_to potin_path(params[:potin_id])

    end
  end

  def index
    
  end

  def edit
    
  end

  def update
  end

  def destroy
  end
end
