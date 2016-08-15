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

  def high_dividend
    @hdiv_raw = []
    self.all_stocks.each do |loop_stock|
      if !loop_stock.dividend_yield 
       @hdiv_raw << [loop_stock.symbol, 0, loop_stock.name, loop_stock.bid, loop_stock.percent_change]  
      else
       @hdiv_raw << [loop_stock.symbol, loop_stock.dividend_yield, loop_stock.name, loop_stock.bid, loop_stock.percent_change]
     end
    end 
    @hdiv_raw.sort_by {|e| e[1]} 
  end

  def all_stocks
    @all_stocks_quote = []
    Stock.all.each do |loop_stock|
      @all_stocks_quote << loop_stock.quote
    end
    @all_stocks = StockQuote::Stock.quote(@all_stocks_quote)
  end

  def value_stocks
    
    
  end


end
