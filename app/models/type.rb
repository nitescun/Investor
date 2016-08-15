class Type < ActiveRecord::Base
  # Remember to create a migration!
  has_many :favorites
  # belongs_to :stock, through: :favorites
end
