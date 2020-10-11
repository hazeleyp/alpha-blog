class Article < ApplicationRecord
    #validate the title field
    belongs_to :user
    validates :title, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 200 }
end