class Stock < ActiveRecord::Base
  # Remember to create a migration!
  has_many :types, through: :favorites
  has_many :favorites
  # belongs_to :user, through: :favorites
  def high_dividend
    @hdiv_raw = []
    self.all_stocks.each do |loop_stock|
      if loop_stock.dividend_yield
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
    @value_raw = []
    self.all_stocks.each do |loop_stock|
      if loop_stock.pe_ratio && loop_stock.bid
       @value_raw << [loop_stock.symbol, loop_stock.pe_ratio, loop_stock.name, loop_stock.bid, loop_stock.percent_change]
     end
    end
    @value_raw.sort_by {|e| e[1]}
  end

  def growth_stocks
    @growth_raw = []
    self.all_stocks.each do |loop_stock|
      if loop_stock.eps_estimate_current_year && loop_stock.eps_estimate_next_year
       @growth_raw << [loop_stock.symbol, (loop_stock.eps_estimate_current_year/loop_stock.eps_estimate_next_year)*100.round(2), loop_stock.name, loop_stock.bid, loop_stock.percent_change]
     end
    end
    @growth_raw.sort_by {|e| e[1]}
  end

  def combination_stocks
    @combination_raw = []
    self.all_stocks.each do |loop_stock|
      if loop_stock.dividend_yield && loop_stock.pe_ratio && loop_stock.bid && loop_stock.eps_estimate_current_year && loop_stock.eps_estimate_next_year
        if loop_stock.dividend_yield >10 && loop_stock.pe_ratio <10 && (loop_stock.eps_estimate_current_year/loop_stock.eps_estimate_next_year)*100 > 10
         @combination_raw << [loop_stock.symbol, (loop_stock.eps_estimate_current_year/loop_stock.eps_estimate_next_year)*100.round(2), loop_stock.name, loop_stock.bid, loop_stock.percent_change, loop_stock.dividend_yield, loop_stock.pe_ratio]
        end
      end
    end
    @combination_raw
  end

end
