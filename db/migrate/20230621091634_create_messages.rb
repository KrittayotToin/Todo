class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :message
      t.boolean :deleted

      t.timestamps
    end
  end
end
