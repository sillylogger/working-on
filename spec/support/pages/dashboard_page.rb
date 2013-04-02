class ProjectSection < SitePrism::Section

  element :title, 'h5 a'
  element :description, 'p'

  def id
    self['id'].sub('project_', '').to_i
  end

end

class Dashboard < SitePrism::Page
  set_url           '/dashboard'
  set_url_matcher %r(/dashboard)

  sections :recent_projects, ProjectSection,  "#recent-projects li.project"
  sections :your_projects,   ProjectSection,  "#your-projects li.project"
  element  :add_project_button,               "#your-projects a[href='/projects/new']"
end
