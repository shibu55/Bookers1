class BooksController < ApplicationController
  def index
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @new_book = Book.new(edit_book_params)


    if @new_book.save
      redirect_to book_path(@new_book.id), notice: "successfully created"
    else
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(edit_book_params)
      redirect_to book_path(@book), notice: "successfully updated"
    else
      render "edit"
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice: "successfully destroy"
  end

  private
  def book_params
    params.permit(:title, :body)
  end
  def edit_book_params
    params.require(:book).permit(:title, :body)
  end
end
