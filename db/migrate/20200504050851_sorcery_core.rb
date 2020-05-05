class SorceryCore < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :email,            null: false
      t.string :crypted_password
      t.string :salt

      t.integer :role, null: false
      t.timestamps                null: false
    end

    add_index :administrators, :email, unique: true
  end
end
