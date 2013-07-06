require 'spec_helper'

describe Project do

  it { should have_many(:collaborators) }
  it { should have_many(:screenshots) }

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
  end

  describe '.recent' do
    subject { Project.recent }

    let(:included_project) { FactoryGirl.create(:project) }
    let(:excluded_project) { FactoryGirl.create(:project, archived: true) }
    let(:really_old_project) { FactoryGirl.create(:project, created_at: 10.years.ago) }

    it { should         include included_project }
    it { should_not     include excluded_project }
    its(:last) { should eq      really_old_project }
  end

  describe '.visible_to' do
    subject { Project.visible_to domain_user }

    let(:included_project) { FactoryGirl.create(:project, user: domain_user) }
    let(:domain_user) { FactoryGirl.create(:user, email: 'user@example.com') }

    let(:excluded_project) { FactoryGirl.create(:project, user: different_domain_user) }
    let(:different_domain_user) { FactoryGirl.create(:user, email: 'user@not-example.com') }

    it { should     include included_project }
    it { should_not include excluded_project }
  end

  describe '.editable_by' do
    subject { Project.editable_by user }

    let(:user) { FactoryGirl.create(:user, :with_projects) }

    let(:included_project) { user.projects.sample }
    let(:excluded_project) { FactoryGirl.create(:project) }

    let(:collaborative_project) { FactoryGirl.create(:project, collaborators_attributes: { '0' => {
      email: user.email
    }}) }

    it { should     include included_project }
    it { should_not include excluded_project }
    it { should     include collaborative_project }
  end

  describe '#editable_by?' do
    let(:project) { FactoryGirl.create(:project) }

    let(:owner)         { project.user }
    let(:random_person) { FactoryGirl.create(:user) }
    let(:collaborator)  { FactoryGirl.create(:user).tap { |u|
      project.collaborators << Collaborator.create(email: u.email)
    } }

    it { project.editable_by?(owner).should be_true }
    it { project.editable_by?(random_person).should be_false }
    it { project.editable_by?(collaborator).should be_true }

    context "when the email has whitespace / case issues" do
      before { collaborator.update_column(:email, "  #{collaborator.email.upcase} ") }

      it "should still be included" do
        project.editable_by?(collaborator).should be_true
      end
    end
  end

end
