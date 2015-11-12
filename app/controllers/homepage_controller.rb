require 'set'
require 'base64'

class HomepageController < ApplicationController
  def books__near_and_then_some_more up_to=5
    unless current_user.nil?
      results = Book.where.not(user_id: current_user).where(borrower_id: nil, user_id: User.within(100, :origin => [ current_user.lat, current_user.lng ])).take(up_to)
      if results.count < up_to
        results += Book.where.not(user_id: current_user).where(borrower_id: nil).where.not(id: results).take(up_to - results.count)
      end
    else
      results = Book.where(borrower_id: nil).take(up_to)
    end
  
    results
  end

  def index
    @trending = true
    @comment = ""
    @booklets = books__near_and_then_some_more
  end

  def by_author
    @trending = false
    @comment = "Showing all books writte by <b>#{Base64.decode64(params[:author])}</b>:".html_safe
    @booklets = Book.where(author: Base64.decode64(params[:author]))
    render 'index'
  end

  def by_user
    @trending = false
    user = User.find(params[:id])
    @comment = "Showing all books owned by <b>#{user.username}</b>:".html_safe
    @booklets = Book.where(user_id: user)
    render 'index'
  end

  def by_location
    @trendin = false
    @latlng = [ params[:lat], params[:lng] ]
    @comment = "Showin all books near this location:".html_safe
    render 'map'
  end

  def books_around
    latlng = [ params[:lat], params[:lng] ]
    users = User.within(100, :origin => latlng)
    books = Book.where(user_id: users)
    user_pub = users.pluck(:id, :lat, :lng, :username)
    render json: { users: user_pub, books: books }
  end
end
