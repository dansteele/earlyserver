class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :label
      t.string :value
      t.string :lat
      t.string :long
    end
  end
end
