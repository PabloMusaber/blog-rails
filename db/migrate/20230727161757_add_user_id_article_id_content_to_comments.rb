class AddUserIdArticleIdContentToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, null: false, foreign_key: true
    add_reference :comments, :article, null: false, foreign_key: true
    add_column :comments, :content, :string
  end
end
