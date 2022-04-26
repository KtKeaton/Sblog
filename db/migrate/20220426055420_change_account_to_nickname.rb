class ChangeAccountToNickname < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :account, :nickname
  end
end
