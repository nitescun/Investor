class Stock < ActiveRecord::Base
  # Remember to create a migration!
  has_many :types, through: :favorites
  has_many :favorites
  # belongs_to :user, through: :favorites
end
