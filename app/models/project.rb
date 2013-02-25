class Project < ActiveRecord::Base

  belongs_to :user
  has_many :screenshots

  accepts_nested_attributes_for :screenshots

  validates :user, :title, presence: true

end
