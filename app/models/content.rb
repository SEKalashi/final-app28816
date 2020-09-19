class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :note
    validates :image
  end
end
