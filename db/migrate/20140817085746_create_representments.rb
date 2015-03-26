class CreateRepresentments < ActiveRecord::Migration
  def change
    create_table :representments do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :collection_id
      t.integer :rate

      t.timestamps
    end
  end
end
