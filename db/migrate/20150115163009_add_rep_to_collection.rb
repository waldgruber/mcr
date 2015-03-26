class AddRepToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :rep, :integer
  end
end
