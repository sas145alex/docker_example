class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :fn
      t.string :ln
      t.string :email

      t.timestamps
    end
  end
end
