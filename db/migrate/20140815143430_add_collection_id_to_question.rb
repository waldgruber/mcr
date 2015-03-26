class AddCollectionIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :collection_id, :integer
  end
end
