class AddCommentToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :parent
  end
end
