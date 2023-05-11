class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh",
  password: "secret", only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
  end
  #Each request for a comment has to keep track of the
  #article to which the comment is attacbed, thus
  #the initial call to the find method of the Article
  #model to get the article in question
  #In addition, the code takes advantage of some of methods
  #available for an association. Wu use the create.
  #This is automatically link the comment so that it belongs
  #to that particular article

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end
end
