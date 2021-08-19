class CreateJoinTableRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_join_table :recipes, :ingredients, table_name: :recipe_ingredients do |t|
      t.index :recipe_id
      t.index :ingredient_id
    end
  end
end
