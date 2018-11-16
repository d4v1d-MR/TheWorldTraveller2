class Tour < ApplicationRecord
  belongs_to :city

  mount_uploader :image, ImageUploader

  validates_processing_of :image
  validate :image_size_validation

  scope :alfabetico, ->{order("tours.title ASC")}

  scope :con_titulo, ->(term=''){ where("tours.title like ?","%#{term}%")}

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 3.megabytes
  end
end
