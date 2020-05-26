class AddYearNoToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :year, :integer
    add_column :posts, :no, :integer
  end
end
