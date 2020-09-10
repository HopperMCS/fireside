class BookReportsController < ApplicationController

  # GET: /book_reports
  get "/book_reports" do
    erb :"/book_reports/index.html"
  end

  # GET: /book_reports/new
  get "/books/:book_id/book_reports/new" do
    erb :"/book_reports/new.html"
  end

  # POST: /book_reports
  post "/book_reports" do
    @book_report = current_user.book_reports.create(:title => params[:title], :synopsis => params[:synopsis], :review => params[:review], :book_id => params[:book_id])
    redirect "/book_reports"
  end

  # GET: /book_reports/5/edit
  get "/book_reports/:id/edit" do
    set_book_report
    redirect_if_not_authorized
    erb :"/book_reports/edit.html"
  end

  # PATCH: /book_reports/5
  patch "/book_reports/:id" do
    set_book_report
    redirect_if_not_authorized
    redirect "/book_reports/:id"
  end

  # DELETE: /book_reports/5/delete
  delete "/book_reports/:id/delete" do
    set_book_report
    redirect_if_not_authorized
    redirect "/book_reports"
  end
end
