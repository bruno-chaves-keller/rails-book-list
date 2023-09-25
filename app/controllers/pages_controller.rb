require 'httparty'

class PagesController < ApplicationController

  def home
    if params[:q].present?
      @books = search_books(params[:q])
    end
  end

  def search_books(query)
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes?q=#{query}&key=#{ENV['GOOGLE_BOOKS_API_KEY']}")

    if response.success?
      items = JSON.parse(response.body)['items']
      detailed_books = []

      items.each do |item|
        detailed_book = get_detailed_book(item['id'])
        detailed_books << detailed_book if detailed_book.present?
      end

      detailed_books
    else
      []
    end
  end

  def get_detailed_book(book_id)
    response = HTTParty.get("https://www.googleapis.com/books/v1/volumes/#{book_id}?key=#{ENV['GOOGLE_BOOKS_API_KEY']}")

    if response.success?
      puts "API Response: #{response.body}"
      JSON.parse(response.body)
    else
      nil
    end
  end

end
