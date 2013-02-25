require 'spec_helper'

describe Project do

  it { should have_many(:screenshots) }

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
  end

  describe '.from_domain' do
    subject { Project.from_domain domain }

    let(:domain) { included_project.user.domain }

    let!(:included_project) { FactoryGirl.create(:project) }
    let!(:excluded_project) { FactoryGirl.create(:project, user: different_domain_user) }
    let!(:different_domain_user) { FactoryGirl.create(:user, email: 'asdf@working-on.com') }

    it { should include(included_project) }
    it { should_not include(excluded_project) }
  end

end
