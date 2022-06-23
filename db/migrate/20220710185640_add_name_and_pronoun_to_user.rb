class AddNameAndPronounToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name, null: true
      t.string :pronoun, null: true
    end
  end
end
