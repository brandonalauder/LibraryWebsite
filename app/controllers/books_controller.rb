class BooksController < ApplicationController
  def admin
  end

  def index
    @books = Book.all
  end

  def search
    @books = Array.new
    Book.all.each do |book|
      unless params[:book]["title"] == ""
        next unless book.title.include? params[:book]["title"]
      end
      unless params[:book]["author"] == ""
        next unless book.author.include? params[:book]["author"]
      end
      unless params[:book]["isbn"] == ""
        next unless book.isbn.include? params[:book]["isbn"]
      end
      @books << book
    end
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))
    if @book.save
      redirect_to admin_index_path
    else
      render 'admin/add'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :author, :isbn, :copies))
      redirect_to admin_search_path
    else
      render 'edit'
    end
  end

  def checkout
    @book = Book.find(params[:id])
    @book.update_attribute(:copies, (@book.copies.to_i - 1).to_s)
    redirect_to admin_search_path
  end
end
