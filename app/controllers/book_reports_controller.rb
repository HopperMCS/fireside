class BookReportsController < ApplicationController

  # GET: /book_reports
  get "/book_reports" do
    erb :"/book_reports/index.html"
  end

  # GET: /book_reports/new
  get "/book_reports/new" do
    erb :"/book_reports/new.html"
  end

  # POST: /book_reports
  post "/book_reports" do
    redirect "/book_reports"
  end

  # GET: /book_reports/5
  get "/book_reports/:id" do
    erb :"/book_reports/show.html"
  end

  # GET: /book_reports/5/edit
  get "/book_reports/:id/edit" do
    erb :"/book_reports/edit.html"
  end

  # PATCH: /book_reports/5
  patch "/book_reports/:id" do
    redirect "/book_reports/:id"
  end

  # DELETE: /book_reports/5/delete
  delete "/book_reports/:id/delete" do
    redirect "/book_reports"
  end
end
