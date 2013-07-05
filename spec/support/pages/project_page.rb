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

  element  :title,       "h1"
  element  :back_link,   "h1 a:first-of-type"
  element  :edit_link,   "h1 a:last-of-type"

  element  :url,          ".project h4 a"

  element  :description,  ".project p"
  elements :technologies, ".project .technologies ul li"
end

class EditProject < ProjectForm
  set_url_matcher %r(/projects/\d+/edit)
  element  :archive, "input[name*='archive'][value='1']"
end

