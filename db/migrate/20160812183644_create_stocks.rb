class CreateStocks < ActiveRecord::Migration
  def change
  	create_table :stocks do |t|
  		t.string :quote
  		# t.string :stockname

  		t.timestamps null: false
  	end
  end
end
