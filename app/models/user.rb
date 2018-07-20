# frozen_string_literal: true

class User < ActiveRecord::Base
  # as long as you install bcrypt in your bundle, this runs
  # reference: http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html
  has_secure_password
end
