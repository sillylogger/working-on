require 'spec_helper'

describe "projects/show" do

  let(:user) { FactoryGirl.build(:user) }

  before(:each) do
    @project = assign(:project, stub_model(Project,
      :title => "Title",
      :url => "Url",
      :description => "MyText",
      :user_id => 1
    ))

    view.stub(:current_user).and_return user
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Url/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
