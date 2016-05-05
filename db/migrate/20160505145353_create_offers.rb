class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :offer_type
      t.string :details

      t.timestamps null: false
    end
  end
end
