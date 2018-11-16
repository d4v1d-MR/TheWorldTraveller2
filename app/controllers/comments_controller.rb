class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def create
    @experience = Experience.find(params[:experience_id])
    @comment = @experience.comments.create(comment_params)
    redirect_to @experience
  end

  def destroy
    @experience = Experience.find_by_id(params[:experience_id])
    if @experience.nil?
      redirect_to experience_path, notice: "operación no permitida"
    end
    @comment = @experience.comments.find(params[:id])
    @comment.destroy
    redirect_to @experience, notice: "comentario eliminado"
  end

  private
  def load_experience
    @experience = Experience.find_by_id(params[:experience_id])
  end
  def comment_params
    params.require(:comment).permit(:name, :email, :body)
  end
end
