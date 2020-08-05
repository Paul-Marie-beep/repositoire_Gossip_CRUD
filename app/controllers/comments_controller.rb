class CommentsController < ApplicationController
  
  def new
    @new_comment = Comment.new

  end

  def create
    @new_comment = Comment.new(title: params[:title],content: params[:content])
    @new_comment.user = User.first
    @new_comment.potin = Potin.find(params[:potin_id])
    @new_comment.save
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
