class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.Micropost.maximum}
  validate :picture_size

  scope :sort_microposts, ->{order created_at: :desc}

  mount_uploader :picture, PictureUploader

  delegate :name, to: :user, prefix: true

  private

  def picture_size
    return unless picture.size > Setting.Image.size.megabytes
    errors.add :picture, t("image_max_size")
  end
end
