class Character < ApplicationRecord

    has_and_belongs_to_many :movies

    scope :by_name, -> name {where(name: name)}
    scope :by_age, -> from, to { where("age >= ? AND age <= ?", from, to) }
    scope :by_weight, -> from, to { where("weight >= ? AND weight <= ?", from, to) }

    scope :by_movie, -> movies {  
    movies_array = (movies.split(',')).map(&:to_i) 
    joins(:movies).where(movies: movies_array)

    validates :name, presence: true, uniqueness:true, on: :create
    validates :age, presence: true, on: :create
    validates :weight, presence: true, on: :create
    validates :storie, presence: true, on: :create

  }
end
