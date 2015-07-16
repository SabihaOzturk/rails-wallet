class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :password
      t.string :fname
      t.string :lname
      t.decimal :balance, default: 0.0
      t.string :phone

      t.timestamps null: false
    end
  end
end
