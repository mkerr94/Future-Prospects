class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
