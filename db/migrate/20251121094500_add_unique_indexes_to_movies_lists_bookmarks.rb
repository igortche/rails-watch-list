class AddUniqueIndexesToMoviesListsBookmarks < ActiveRecord::Migration[7.1]
  def change
    # Add unique index on movie title
    add_index :movies, :title, unique: true

    # Add unique index on list name
    add_index :lists, :name, unique: true

    # Ensure a movie can only be added once per list
    add_index :bookmarks, [:movie_id, :list_id], unique: true
  end
end
