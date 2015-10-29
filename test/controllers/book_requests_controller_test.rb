require 'test_helper'

class BookRequestsControllerTest < ActionController::TestCase
  setup do
    @book_request = book_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_request" do
    assert_difference('BookRequest.count') do
      post :create, book_request: { approved: @book_request.approved, book_id: @book_request.book_id, borrower_id: @book_request.borrower_id, lender_id: @book_request.lender_id, loan_period: @book_request.loan_period }
    end

    assert_redirected_to book_request_path(assigns(:book_request))
  end

  test "should show book_request" do
    get :show, id: @book_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_request
    assert_response :success
  end

  test "should update book_request" do
    patch :update, id: @book_request, book_request: { approved: @book_request.approved, book_id: @book_request.book_id, borrower_id: @book_request.borrower_id, lender_id: @book_request.lender_id, loan_period: @book_request.loan_period }
    assert_redirected_to book_request_path(assigns(:book_request))
  end

  test "should destroy book_request" do
    assert_difference('BookRequest.count', -1) do
      delete :destroy, id: @book_request
    end

    assert_redirected_to book_requests_path
  end
end
