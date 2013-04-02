class ShowProject < SitePrism::Page

  set_url_matcher %r(/projects/\d+)

  element  :title,       "h1"
  element  :url,         "h4 a"
  element  :description, "p.intro"

end
