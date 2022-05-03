class Article < ApplicationRecord
   
    #adding validation to articles tables, to require a specific format or lenght
   validates :title, presence: true, length: { minimum: 6, maximum: 100 }
   validates :description, presence: true, length: { minimum: 10, maximum: 300 }
end