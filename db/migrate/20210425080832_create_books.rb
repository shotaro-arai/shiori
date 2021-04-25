class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.text :text
      t.text :quote,      null:false
      t.string :title,    null:false
      t.string :author,   null:false
      t.string :publish,  null:false
      t.integer :year,    null:false
      t.integer :page,    null:false
      t.text :title_option
      t.references :user, null:false, foreign_key:true
      t.timestamps
    end
  end
end
