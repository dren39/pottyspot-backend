class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :toilets, :lat, :float
  end
end
