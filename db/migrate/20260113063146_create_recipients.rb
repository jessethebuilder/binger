class CreateRecipients < ActiveRecord::Migration[7.1]
  def change
    create_table :recipients do |t|
      t.string :name, null: false
      t.string :email
      t.string :phone
      t.string :status
      t.references :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
