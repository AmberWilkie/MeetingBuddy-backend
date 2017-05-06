class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :summary
      t.string :length

      t.timestamps
    end
  end
end
