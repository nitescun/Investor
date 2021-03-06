require 'bcrypt'

class User < ActiveRecord::Base
  # users.password_hash in the database is a :string
  include BCrypt

  has_many :stocks, through: :favorites
  has_many :favorites

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

  def favorite_stocks
    @stocks = []
    self.stocks.each do |loop_stock|
      @stocks << loop_stock.quote
    end
    StockQuote::Stock.quote(@stocks)
  end


end
