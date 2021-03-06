require 'spec_helper'

describe Collaborator do

  it { should belong_to(:project) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

end
