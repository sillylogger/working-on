class Project < ActiveRecord::Base

  belongs_to :user
  has_many :screenshots

  accepts_nested_attributes_for :screenshots

  validates :user, :title, presence: true

  scope :from_domain, ->(domain) { includes(:user).where(users: { domain: domain }) }

end
