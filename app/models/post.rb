class Post < ApplicationRecord
  before_save :set_slug

  has_one_attached :thumbnail_image
  has_rich_text :body
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validate :acceptable_image
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  self.per_page = 3

  def to_param
    slug
  end

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

  def set_slug
    self.slug = title.parameterize
  end

end
