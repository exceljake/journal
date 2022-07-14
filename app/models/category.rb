class Category < ApplicationRecord
    validates :name, presence: true,
    uniqueness: true

    validates :details, presence: true,
    length: { minimum: 5 }

    has_many :tasks
end
