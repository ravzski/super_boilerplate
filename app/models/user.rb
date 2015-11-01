class User < ActiveRecord::Base
  include Authenticable

  validates :email, presence: true,  uniqueness: true
  validate :validate_password_presence
  validate :validate_password_length

  has_many :access_tokens

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
