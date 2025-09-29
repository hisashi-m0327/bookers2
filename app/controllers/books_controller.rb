class BooksController < ApplicationController
   before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to @book
    else
      @books =Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
