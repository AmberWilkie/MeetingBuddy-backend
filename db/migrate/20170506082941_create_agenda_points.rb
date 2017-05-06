class CreateAgendaPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :agenda_points do |t|
      t.references :user, foreign_key: true
      t.references :meeting, foreign_key: true
      t.string :body
      t.integer :time

      t.timestamps
    end
  end
end
