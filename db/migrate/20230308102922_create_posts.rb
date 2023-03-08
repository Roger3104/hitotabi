class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true
      t.string :title, null: false
      # t.datetime :date, null: false, default: -> { 'CURRENT_TIMESTAMP' } # 2023-03-08 19:41:55
      t.date :date, null: false, default: -> { '(CURRENT_DATE)' } # 2023-03-08
      # defaultを投稿作成日時に設定
      t.text :content
      t.string :address
      t.float :latitude
      t.float :longitude
      # need to add draft

      t.timestamps
    end
  end
end
