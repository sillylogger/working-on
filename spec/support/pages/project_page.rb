class ProjectForm < SitePrism::Page
  element  :title,       "input[name*='title']"
  element  :url,         "input[name*='url']"
  element  :description, "textarea[name*='description']"
  element  :save_button, "input[name='commit']"
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

  element  :url,         "h4 a"

  element  :description, "p.intro"
end

class EditProject < ProjectForm
  set_url_matcher %r(/projects/\d+/edit)
  element  :archive, "input[name*='archive'][value='1']"
end

