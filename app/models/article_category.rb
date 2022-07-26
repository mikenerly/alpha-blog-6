class ArticleCategory < ApplicationRecord
    #add the associations 
    belongs_to :article
    belongs_to :category
    
end