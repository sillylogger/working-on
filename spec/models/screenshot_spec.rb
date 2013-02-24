require 'spec_helper'

describe Screenshot do
  it { should belong_to(:project) }
end
