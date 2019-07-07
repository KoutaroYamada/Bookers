class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    book = Book.new(books_params)
    book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book)

  end

  def show
    @book = Book.find(params[:id])

  end

  def new
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    book = Book.find(params[:id])
    book.update(books_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path

  end

  private
  def books_params
    params.require(:book).permit(:title, :body)

  end

end
