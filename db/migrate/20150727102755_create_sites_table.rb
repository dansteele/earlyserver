class CreateSitesTable < ActiveRecord::Migration
  def change
    create_table :sites_tables do |t|
      t.string :sites
      t.string :label
      t.string :value
      t.string :lat
      t.string :long
    end
  end
end
