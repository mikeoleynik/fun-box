class AddForceToRate < ActiveRecord::Migration[5.2]
  def change
    add_column :rates, :end_date, :datetime
    add_column :rates, :forced, :boolean, default: false
  end
end
