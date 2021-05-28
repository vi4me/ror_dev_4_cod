class RemoveAvatarContentTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :avatar_content_type, :string
  end
end
