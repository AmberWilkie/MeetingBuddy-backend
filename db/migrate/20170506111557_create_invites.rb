class CreateInvites < ActiveRecord::Migration[5.0]
  def change
    create_table :invites do |t|
      t.boolean :accepted
      t.references :user, foreign_key: true
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
