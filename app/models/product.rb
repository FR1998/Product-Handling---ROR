class Product < ApplicationRecord

    belongs_to :user
    validates :product_name, presence: true, uniqueness: true
    validates :quantity, presence: true
    validates :price, presence: true

end
