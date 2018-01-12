class User < ApplicationRecord
    self.table_name = "admin_users"
    has_secure_password
    has_and_belongs_to_many :pages
    has_many :section_edits
    has_many :sections, :through => :section_edits 
    
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
    FORBIDDEN_USERNAMES = ['littlebopeep', 'humptydumpty', 'marymary']
    validates :first_name, presence: true, length: {maximum: 25}
    validates :last_name, presence: true, length: {maximum: 50}
    validates :username, presence: true, length: {within: 6..25}, uniqueness: true
    validates :email, presence: true, length: {maximum: 100}, format: { with: EMAIL_REGEX}, confirmation: true

    validate :username_is_allowed
    validate :no_new_users_on_thursday, :on => :create

    scope :sorted, ->{ order(last_name: :asc, first_name: :asc)}
    def name
        "#{first_name} #{last_name}"
    end
    private

    def username_is_allowed
        if FORBIDDEN_USERNAMES.include?(username)
            error.add(:username, "has been restricted from use.")
            
        end
    end

    def no_new_users_on_thursday
      if Time.now.wday == 4
          errors.add(:base, "No new users on Thursdays.")
      end

    end
end
