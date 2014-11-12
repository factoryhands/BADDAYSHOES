class Shoe < ActiveRecord::Base
  # has_and_belongs_to_many :users
  belongs_to :closets

  #method to grab heels
  def self.get_active_sales
    active_sales = Gilt::Sale.active :apikey => ENV['GILT_ID']
    womens_sales = active_sales.select {|sale| sale.store == Gilt::Stores::WOMEN }
    womens_sales.take(10).map(&:products).flatten.select { |product| product.description.include? 'shoe' }.map(&:images)
    # return if categories = "shoes"
  end


# #method to grab boots
#   def self.get_active_sales
#     active_sales = Gilt::Sale.active :apikey => ENV['GILT_ID']
#     womens_sales = active_sales.select {|sale| sale.store == Gilt::Stores::WOMEN }
#     # active_sales.first.products.map(&:images)
#     images = womens_sales.first.products.map(&:images)
#     return images
#     # return if categories = "shoes"
#   end

  # #method to grab expensive shoes
  # def self.get_active_sales
  #   active_sales = Gilt::Sale.active :apikey => ENV['GILT_ID']
  #   womens_sales = active_sales.select {|sale| sale.store == Gilt::Stores::WOMEN }
  #   # active_sales.first.products.map(&:images)
  #   images = womens_sales.first.products.map(&:images)
  #   return images
  #   # return if categories = "shoes"
  # end

end
