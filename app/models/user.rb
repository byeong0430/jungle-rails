# frozen_string_literal: true

class User < ActiveRecord::Base
  # as long as you install bcrypt in your bundle, this runs
  # reference: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password

  # association
  has_many :reviews

  # validation
  validates_uniqueness_of :email, case_sensitive:false
  validates :email, :first_name, :last_name, presence: true
  validates_length_of :password, minimum: 5

  def self.authenticate_with_credentials(email, password)
    # find the input email in users table
    @user = User.find_by_email(email)

    # check if the input email exists AND the user can be authenticated with the input password
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  # callback before creation
  before_create do
    self.email = self.email.strip
  end

end
