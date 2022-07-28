class Article < ApplicationRecord
   #add code for belong association of user
   belongs_to :user
   #add many-to-many association
   has_many :article_categories
   has_many :categories, through: :article_categories
    #adding validation to articles tables, to require a specific format or lenght
   validates :title, presence: true, length: { minimum: 6, maximum: 200 }
   validates :description, presence: true, length: { minimum: 10, maximum: 2000 }
end