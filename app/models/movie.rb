class Movie < ApplicationRecord

    has_and_belongs_to_many :characters
    has_and_belongs_to_many :genres
    
    validates :title, presence: true, uniqueness: true
    
    scope :by_title, -> title {where("title LIKE ?", "%" + title + "%")}
    scope :by_genre, -> genres {
    genre_array = (genres.split(',')).map(&:to_i) 
    joins(:genres).where(genres: genre_array)
  }
end
