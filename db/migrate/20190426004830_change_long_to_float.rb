class ChangeLongToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :toilets, :long, :float
  end
end
