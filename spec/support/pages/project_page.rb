class ProjectForm < SitePrism::Page
  element  :title,       "input[name*='title']"
  element  :url,         "input[name*='url']"
  element  :description, "textarea[name*='description']"

  element  :technologies,     "li.select2-search-choice"
  element  :technology_input, "li.select2-search-field input"

  element  :save_button, "input[type='submit']"

  def add_technology tech
    technology_input.set tech + "\n"
  end
end


class NewProject < ProjectForm
  set_url           '/projects/new'
  set_url_matcher %r(/projects/new)
end

class ShowProject < SitePrism::Page
  set_url_matcher %r(/projects/\d+)

  element  :title,       "h2"
  element  :edit_link,   "a.edit"

  element  :url,          "p.url a"
  elements :technologies, "div.technologies ul li"
  element  :description,  "p.description"
end

class EditProject < ProjectForm
  set_url_matcher %r(/projects/\d+/edit)
  element  :archive, "input[name*='archive'][value='1']"
end

