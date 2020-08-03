class Post < ApplicationRecord
  has_one_attached :thumbnail_image
  has_rich_text :body
  belongs_to :user

  validate :acceptable_image

  self.per_page = 3

  private

  def acceptable_image
    return unless thumbnail_image.attached?

    unless thumbnail_image.blob.byte_size <= 1.megabyte
      errors.add(:thumbnail_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]

    unless acceptable_types.include?(thumbnail_image.content_type)
      errors.add(:thumbnail_image, "must be a JPEG or PNG")
    end
  end

end
