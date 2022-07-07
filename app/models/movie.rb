class Movie < ApplicationRecord

    has_and_belongs_to_many :characters
    has_and_belongs_to_many :genres

    scope :by_title, -> title {where("title LIKE ?", "%" + title + "%")}
    scope :by_genre, -> genres {
    genre_array = (genres.split(',')).map(&:to_i) 
    joins(:genres).where(genres: genre_array)

    validates :title, presence: true, uniqueness: true, on: :create
    validates :image, presence: true, on: :create
    validates :release_date, presence: true, , on: :create
    validates :rating, presence: true, length: {minimum:0 maximum:5}, , on: :create
  }
end
