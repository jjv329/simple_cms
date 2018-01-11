class Section < ApplicationRecord
    belongs_to :page
    has_many :section_edits
    has_many :users, through: :section_edits

    CONTENT_TYPES = ['text','HTML']

    validates_presence_of :name, :conent
    validates_length_of :name, :maximum => 255
    validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "must be one of: #{CONTENT_TYPES.join(', ')}"


    scope :visible, ->{ where(:visible => true) }
    scope :invisible, ->{ where(:visible => false) }
    scope :sorted, ->{ order("position ASC")}
    scope :newest_first, ->{ order("created_at DESC")}
    scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

end
