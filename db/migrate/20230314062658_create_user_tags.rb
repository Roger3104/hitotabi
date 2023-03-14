class CreateUserTags < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tags do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
    # 同じタグを２回保存するのは出来ないようになる, 複合キーインデックス
    add_index :user_tags, [:user_id, :tag_id], unique: true
  end
end
