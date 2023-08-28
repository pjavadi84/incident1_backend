class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.string :title
      t.string :link
      t.string :description
      t.date :pubDate

      t.timestamps
    end
  end
end
