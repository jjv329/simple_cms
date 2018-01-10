class Section < ApplicationRecord
    belongs_to :page
    has_many :section_edits
    has_many :users, through: :section_edits
end
