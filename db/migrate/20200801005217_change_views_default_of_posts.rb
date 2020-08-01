class ChangeViewsDefaultOfPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :posts, :views, from: nil, to: 0
  end
end
