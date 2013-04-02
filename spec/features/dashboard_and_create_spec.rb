require 'spec_helper'

feature 'the dashboard & create pages', js: true do

  given(:user)      { FactoryGirl.create(:user, :with_projects) }

  given(:dashboard) { Dashboard.new }
  given(:new_project) { NewProject.new }
  given(:show_project) { ShowProject.new }

  context 'with lots of projects' do
    given(:coworker) { FactoryGirl.create(:user, :with_projects, email: "coworker@#{user.domain}") }

    scenario 'viewing the dashboard' do
      all_projects_count = user.projects.size + coworker.projects.size
      expect(all_projects_count).to be > 0

      user_projects_count = user.projects.size
      expect(user_projects_count).to be > 0

      login_as user

      dashboard.load
      dashboard.should be_displayed

      expect(dashboard.recent_projects.size).to eq(all_projects_count)
      expect(dashboard.your_projects.size).to eq(user_projects_count)
    end
  end

  given(:new_title)       { "The Next Big Thing" }
  given(:new_url)         { "http://letsidea.com" }
  given(:new_description) { "A collaborative working space, online." }

  scenario 'creating & viewing a project' do
    login_as user

    dashboard.load
    dashboard.should be_displayed

    dashboard.add_project_button.click

    new_project.should be_displayed
    new_project.title.set new_title
    new_project.url.set new_url
    new_project.description.set new_description
    new_project.save_button.click

    show_project.should be_displayed
    expect(show_project.title.text).to include(new_title)
    expect(show_project.url.text).to eq(new_url)
    expect(show_project.description.text).to eq(new_description)
  end

end

