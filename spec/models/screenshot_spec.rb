require 'spec_helper'

describe Screenshot do

  it { should belong_to(:project) }

  describe 'validations' do
    it { should validate_presence_of(:image) }
  end

end
