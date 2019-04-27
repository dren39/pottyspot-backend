class ChangeDistanceToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :toilets, :distance, :float
  end
end
