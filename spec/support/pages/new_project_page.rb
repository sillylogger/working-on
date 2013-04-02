class NewProject < SitePrism::Page
  set_url           '/projects/new'
  set_url_matcher %r(/projects/new)

  element  :title,       "input[name*='title']"
  element  :url,         "input[name*='url']"
  element  :description, "textarea[name*='description']"
  element  :save_button, "input[name='commit']"
end
