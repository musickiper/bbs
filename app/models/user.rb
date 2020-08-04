class User < ApplicationRecord
  before_save :set_slug

  has_secure_password

  has_one_attached :profile_image
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :email, email: true, presence: true,
            uniqueness: {case_sensitive: false}
  validates :username, presence: true,
            uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 10, allow_blank: true}
  validate :acceptable_image

  def to_param
    slug
  end

  private

  def acceptable_image
    return unless profile_image.attached?

    unless profile_image.blob.byte_size <= 1.megabyte
      errors.add(:profile_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png"]

    unless acceptable_types.include?(profile_image.content_type)
      errors.add(:profile_image, "must be a JPEG or PNG")
    end
  end

  def set_slug
    self.slug = username.parameterize
  end

end
