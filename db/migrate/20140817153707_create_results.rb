class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :collection_id
      t.integer :points

      t.timestamps
    end
  end
end
