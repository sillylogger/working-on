class Project < ActiveRecord::Base

  belongs_to :user
  has_many :collaborators

  has_many :screenshots

  acts_as_taggable
  acts_as_taggable_on :technologies

  accepts_nested_attributes_for :collaborators, allow_destroy: true
  accepts_nested_attributes_for :screenshots,   allow_destroy: true

  validates :user, :title, presence: true

  scope :recent,      ->          { where(archived: false).order(created_at: :desc)  }
  scope :visible_to,  ->(user)    { includes(:user).where(users: { domain: user.domain }) }
  scope :editable_by, ->(user)    { includes(:user).joins('LEFT OUTER JOIN collaborators ON collaborators.project_id = projects.id')
                                      .where("projects.user_id = ? OR collaborators.email = ?", user.id, user.email) }

  def editable_by? user
    tidy_emails = collaborators.map(&:email).map(&:downcase).map(&:strip)
    self.user == user || tidy_emails.include?(user.email.downcase.strip)
  end

end
