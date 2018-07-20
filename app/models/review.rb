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
  # check if description is NOT empty
  validates :description, length: {minimum: 1}
end
