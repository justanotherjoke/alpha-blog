class AddTimestampToArticles < ActiveRecord::Migration[6.0]
  def change
    #add_column a metodus, amivel meglevo tablahoz hozza tudok adni oszlopot
    # az elso argumentum a tabla neve, itt articles
    # a masodik argumentum az argumentum neve, ennek a neve cretated_at kell legyen, kulonben nem lesz az 
    # a magikus mezo, amit a rail lekovet nekunk
    # a harmadik argumentum a datatype
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime  
  end
end
