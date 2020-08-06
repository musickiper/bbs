module LikesHelper

  def like_or_unlike_button(post, like)
    if like
      button_to "★ #{post.likes.count}", post_like_path(post, like), class: "btn btn-success rounded-circle", method: :delete
    else
      button_to "✩ #{post.likes.count}", post_likes_path(post), class: "btn btn-light rounded-circle"
    end
  end
end
