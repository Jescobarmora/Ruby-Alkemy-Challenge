class Genre < ApplicationRecord
    
    has_and_belongs_to_many :movies
    
    validates :name, presence: true, uniqueness: true, on: :create
    validates :image, presence: true, on: :create

end
