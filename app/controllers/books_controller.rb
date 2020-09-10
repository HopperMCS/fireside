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

  # GET: /books/5/edit
  get "/books/:id/edit" do
    no_permit
    erb :"/books/edit.html"
  end

  # PATCH: /books/5
  patch "/books/:id" do
    no_permit
    redirect "/books/:id"
  end

  # DELETE: /books/5/delete
  delete "/books/:id/delete" do
    no_permit
    redirect "/books"
  end
end
