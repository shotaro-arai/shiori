class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :text, null: false
      t.string :age, null: false
      t.string :sex, null: false
      t.string :job
      t.references :user
      t.timestamps
    end
  end
end
