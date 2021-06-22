class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :user, foreign_key: true
      t.references :picture, foreign_key: true
      t.string :name
      t.string :email
      t.text :content
      t.timestamps
    end
  end
end
