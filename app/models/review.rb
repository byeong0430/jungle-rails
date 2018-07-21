# frozen_string_literal: true

class Review < ActiveRecord::Base
  # association
  belongs_to :user
  belongs_to :product

  # validation
  # check if all fields are present
  validates :product_id, :user_id, :description, :rating, presence: true
  # check if ids and ratings are integers
  validates :product_id, :user_id, :rating, numericality: {
    only_integer: true
  }
  # check if rating is between 1 and 5
  validates_inclusion_of :rating, in: 1..5
end
