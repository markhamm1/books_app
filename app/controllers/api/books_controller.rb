class Api::BooksController < ApplicationController
  def index
    @books = Book.all
    render 'index.json.jb'
  end

  def show
    @book = Book.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @book = Book.create(
      name: params[:name],
      isbn: params[:isbn],
      genre: params[:genre]
    )
    @book.save
    render 'show.json.jb'
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(
      name: params[:name] || @book.name,
      isbn: params[:isbn] || @book.isbn,
      genre: params[:genre] || @book.genre
    )
    @book.save
    render 'show.json.jb'
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render json: {message: "The book has been deleted"}
  end
end
