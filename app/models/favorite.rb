class Favorite < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :stock
  belongs_to :type
end
