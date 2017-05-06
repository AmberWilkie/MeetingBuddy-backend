class MeetingLengthToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :meetings, :length, 'integer USING CAST(length AS integer)'
  end
end
