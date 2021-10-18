class PatronController < ApplicationController
  def searchresults
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

  def search
  end
end
