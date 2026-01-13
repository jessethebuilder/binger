class CreateCampaigns < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :title, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
