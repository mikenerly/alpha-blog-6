class Category < ApplicationRecord
#add a validation rules
    validates :name, presence: true #length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name #this will that you don't have duplicate name
    validates :name, length: { minimum: 3, maximum: 25}
    

end