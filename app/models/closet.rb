class Closet < ActiveRecord::Base
    has_many :shoes
  # belongs_to_many :users
end
