class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title # ez a resz (a torzs) mar nem generealodott a 'rails generate migration create_articles' parancsra
      t.text :description
    end
  end
end
