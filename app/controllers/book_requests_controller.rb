class BookRequestsController < ApplicationController
  before_action :set_book_request, only: [:show, :edit, :update, :destroy]

  # GET /book_requests
  # GET /book_requests.json
  def index
    @book_requests = BookRequest.all
  end

  # GET /book_requests/1
  # GET /book_requests/1.json
  def show
    @book = Book.find_by_id(@book_request.book_id)
  end

  # GET /book_requests/new/1
  def new
    @book_request = BookRequest.new

  end

  # GET /book_requests/1/edit
  def edit
  end

  # POST /book_requests
  # POST /book_requests.json
  def create
    @user = current_user
    @book_request = BookRequest.new(book_request_params)
    @book_request.borrower_id=@user.id
    book_id  = params[:book_id]
    @book = Book.find_by_id(book_id.to_i)
    @book_request.book_id=book_id
    @book_request.lender_id = @book.owner_id

    respond_to do |format|
      if @book_request.save
        format.html { redirect_to @book_request, notice: 'Book request was successfully created.' }
        format.json { render :show, status: :created, location: @book_request }
      else
        format.html { render :new }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_requests/1
  # PATCH/PUT /book_requests/1.json
  def update
    respond_to do |format|
      if @book_request.update(book_request_params)
        format.html { redirect_to @book_request, notice: 'Book request was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_request }
      else
        format.html { render :edit }
        format.json { render json: @book_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_requests/1
  # DELETE /book_requests/1.json
  def destroy
    @book_request.destroy
    respond_to do |format|
      format.html { redirect_to book_requests_url, notice: 'Book request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_request
      @book_request = BookRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_request_params
      params.require(:book_request).permit(:book_id, :lender_id, :borrower_id, :loan_period, :approved)
    end
end
