module PostsHelper

  def thumbnail_image(post)
    if post.thumbnail_image.attached?
      image_tag post.thumbnail_image.variant(resize_to_limit: [300, 300]), class: "card-img-top", style: "max-height: 300px;"
    else
      image_tag "https://via.placeholder.com/300x300/20c997/FFFFFF?text=#{post.title}", class: 'card-img-top', style: "max-height: 300px"
    end
  end

end
