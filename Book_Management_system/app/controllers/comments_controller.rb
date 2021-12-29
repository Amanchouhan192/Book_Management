class CommentsController < ApplicationController
  def index
    @book = Book.find_by(id: params[:book_id])
    @comments = @book.comments
  end

  def show
    @comments = @book.comments
  end

  def new
    @book = Book.find_by(id: params[:book_id])
    @comment = @book.comments.new
  end


  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(params[:comment].permit(:body))
    redirect_to(book_comments_path(@book))
  end

  def edit
    @book = Book.find_by(id: params[:book_id])
    @comment = @book.comments.find_by(id: params[:id])
  end

  def update
    @comment = @book.comments.find_by(id: params[:id])
    @comment.update comment_params
    redirect_to '/books/:id/comments'
  end

  def find_post
    @book = Book.find_by(id: params[:post_id])
  end

  private 
    def comment_params
      params.require(:comment).permit(:body,:book_id)
    end
  
end
