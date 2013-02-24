require 'spec_helper'

describe Project do

  it { should have_many(:screenshots) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

end
