module Admin::PlacesControllerHelper
  def place_hierarchy places
    places.map do |place, children|
      render(place) +
        (children.any? ? content_tag(:div, place_hierarchy(children),
          class: "child-place") : nil)
    end.join.html_safe
  end
end
