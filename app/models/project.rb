class Project < ActiveRecord::Base

  belongs_to :user
  has_many :screenshots

  accepts_nested_attributes_for :screenshots

  validates :user, :title, presence: true

  def self.from_domain domain
    joins(:user).where(users: { domain: domain })
  end

end
