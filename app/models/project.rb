class Project < ActiveRecord::Base

  belongs_to :user
  has_many :screenshots

  acts_as_taggable
  acts_as_taggable_on :technologies

  accepts_nested_attributes_for :screenshots, allow_destroy: true

  validates :user, :title, presence: true

  scope :recent,      ->          { where(archived: false).order(created_at: :desc)  }
  scope :from_domain, ->(domain)  { includes(:user).where(users: { domain: domain }) }

end
