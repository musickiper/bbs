module ApplicationHelper

  def profile_image(user, width, height)
    if user.profile_image.attached?
      image_tag user.profile_image.variant(resize_to_limit: [width, height]), class: "img-thumbnail rounded-circle", style: "width: #{width}px; height:#{height}px;"
    else
      image_tag "profile_placeholder.png", class: 'img-thumbnail rounded-circle', style: "width: #{width}px; height:#{height}px;"
    end
  end

end
