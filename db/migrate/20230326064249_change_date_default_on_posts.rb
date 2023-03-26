class ChangeDateDefaultOnPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default :posts, :date, from: nil, to: nil
  end
end
