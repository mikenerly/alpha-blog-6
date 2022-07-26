class Category < ApplicationRecord
#add a validation rules
    validates :name, presence: true #length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name #this will that you don't have duplicate name
    validates :name, length: { minimum: 3, maximum: 25}
    #has many-to-many association level
    has_many :article_categories
    has_many :articles, through: :article_categories

end