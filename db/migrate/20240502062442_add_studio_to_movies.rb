class AddStudioToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :studio, :string
  end
end
