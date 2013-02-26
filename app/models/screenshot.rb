class Screenshot < ActiveRecord::Base

  belongs_to :project

  mount_uploader :image, ScreenshotUploader

  validates :image, presence: true

end
