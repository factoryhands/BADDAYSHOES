class Shoe < ActiveRecord::Base
  # has_and_belongs_to_many :users
  belongs_to :closets

  #method to grab pumps
  def self.get_shoes
    @shoe_photos=[]
    query = 'shoe'
    store = 'women'
    @endpoint_url = "https://api.gilt.com/v1/products?apikey=#{ENV["GILT_ID"]}&q=#{query}&store=#{store}"
    response = RestClient.get(@endpoint_url)
    parsed_response = JSON.parse(response)
  end

  def self.get_images
    get_shoes["products"].map do |shoe|
      photos = shoe["image_urls"]["300x400"][0]["url"]
    end
  end

  def self.get_type(shoe_type)
    collection = []
    get_shoes["products"].map do |shoe|
      pump = shoe["content"]["description"]
      if pump.include? shoe_type
        collection << shoe["image_urls"]["300x400"][0]["url"]
      end
    end
    collection
  end

end
