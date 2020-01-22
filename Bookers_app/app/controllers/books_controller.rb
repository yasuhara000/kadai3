class BooksController < ApplicationController
    def new
      @book = Book.new

    end
    def create

      @book = Book.new(params_book)
      @book.user = current_user
      @books = Book.all
      if @book.save
        flash[:notice] = "You have created book successfully"
        redirect_to book_path(@book.id)

      else
        render :index
      end
    end

    def show

      @book1 = Book.find(params[:id])

      @user = @book1.user
      @book = Book.new


    end
    def index
      @books = Book.all

      @book = Book.new
      

    end
    def edit
      @book = Book.find(params[:id])

      if @book.user != current_user
        redirect_to books_path
      end
    end
    def update
      @book = Book.find(params[:id])
      @books = Book.all
      @book.update(params_book)
      if @book.save
        flash[:notice] = "You have updated book successfully"
        redirect_to book_path(@book.id)
      else
        render :index
      end
      if @book.user != current_user
        redirect_to :index
      end
    end
    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to book_index_path
    end
  private

  def params_book
    params.require(:book).permit(:title, :body)

  end
end
