class BooksController < ApplicationController
  # GET: /books
  get "/books" do
    no_permit
    erb :"/books/index.html"
  end

  # GET: /books/new
  get "/books/new" do
    no_permit
    erb :"/books/new.html"
  end

  # POST: /books
  post "/books" do
    no_permit
    @book = Book.create(:title => params[:title], :author => params[:author], :release_year => params[:release_year], :purchase_link => params[:purchase_link])
    redirect "/books"
  end

  # GET: /books/5
  get "/books/:id" do
    no_permit
    set_book
    erb :"/books/show.html"
  end

  helpers do
    def authorize_book_report(report)
      current_user == report.user
    end

    def set_book
      @book = Book.find_by_id(params[:id])
      if @book.nil?
        flash[:error] = "Couldn't find a book with id: #{params[:id]}"
        redirect "/books"
      end
    end
  end
end
