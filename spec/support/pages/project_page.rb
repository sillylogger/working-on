class ProjectForm < SitePrism::Page
  element  :title,       "input[name*='title']"
  element  :url,         "input[name*='url']"
  element  :description, "textarea[name*='description']"

  element  :technologies,         "li.select2-search-choice"
  element  :technologies_input,   "li.select2-search-field input"

  element  :add_collaborator_link,  "a[data-association='collaborators']"
  elements :collaborator_inputs,    ".collaborator input[type='text']"

  element  :save_button,  "input[type='submit']"

  def add_technology tech
    technologies_input.set tech + "\n"
  end

  def add_collaborator collaborator
    add_collaborator_link.click
    collaborator_inputs.last.set collaborator
  end
end


class NewProject < ProjectForm
  set_url           '/projects/new'
  set_url_matcher %r(/projects/new)
end

class ShowProject < SitePrism::Page
  set_url           '/projects{/id}'
  set_url_matcher %r(/projects/\d+)

  element  :title,       "h2"
  element  :edit_link,   "a.edit"

  element  :external_url, "p.external_url a"
  elements :technologies, "div.technologies ul li"
  element  :description,  "p.description"

  elements :collaborators, "div.collaborators ul li"
end

class EditProject < ProjectForm
  set_url_matcher %r(/projects/\d+/edit)

  element  :archive, "input[name*='archive'][value='1']"
end

