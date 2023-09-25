class BooksController < ApplicationController
  def index
    if params[:q].present?
      response = GoogleBooks.search(params[:q])
      @books = response['items'] if response.present?
    end
  end
end
