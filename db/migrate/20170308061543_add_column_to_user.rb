class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kana, :string, index: true
  end
end
