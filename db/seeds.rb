# Create first user via application
@user = User.find_by_id(1)

# Book object tests
@book1 = Book.create(:title => "Test 1", :author => "Gage", :release_year => "2020", :purchase_link => "gages.blog")
@book2 = Book.create(:title => "Test 2", :author => "Gage", :release_year => "2020", :purchase_link => "gages.blog")
@book3 = Book.create(:title => "Test 3", :author => "Gage", :release_year => "2020", :purchase_link => "gages.blog")
@book4 = Book.create(:title => "Test 4", :author => "Gage", :release_year => "2020", :purchase_link => "gages.blog")

# Book Reports
@book_report1 = BookReport.create(:synopsis => "test 1", :rating => "test")
@book_report2 = BookReport.create(:synopsis => "test 2", :rating => "test")
@book_report3 = BookReport.create(:synopsis => "test 3", :rating => "test")
@book_report4 = BookReport.create(:synopsis => "test 4", :rating => "test")

# Associate book_reports with user
@user.book_reports << @book_report1
@user.book_reports << @book_report2
@user.book_reports << @book_report3
@user.book_reports << @book_report4

# Associate book_reports with books
@book_report1.update(:book => @book1)
@book_report2.update(:book => @book2)
@book_report3.update(:book => @book3)
@book_report4.update(:book => @book4)


