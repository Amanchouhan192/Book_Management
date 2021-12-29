class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      redirect_to(books_path)
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  private
    def books_params
      params.require(:book).permit(:title, :publish_date, :author_id)
    end
end
