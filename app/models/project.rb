class Project < ActiveRecord::Base

  has_many :screenshots

  accepts_nested_attributes_for :screenshots

  validates :title, presence: true

end
