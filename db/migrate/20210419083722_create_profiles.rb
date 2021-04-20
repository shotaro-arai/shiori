class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :text,null: false
      t.string :age
      t.string :sex
      t.string :job
      t.references :user
      t.timestamps
    end
  end
end
