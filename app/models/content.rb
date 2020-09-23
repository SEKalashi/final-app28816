class Content < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :note
    validates :image
  end

  def self.search(search)
    if search != ""
      Content.where('title LIKE(?)', "%#{search}%")
    else
      Content.all
    end
  end
end
