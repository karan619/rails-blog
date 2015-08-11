class AddNameBodyToComments < ActiveRecord::Migration
  def change
    add_column :comments, :name, :string
    add_column :comments, :comment, :text
  end
end
