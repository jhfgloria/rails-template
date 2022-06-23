class CreateUserWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :user_workspaces do |t|
      t.references :user, index: true, foreign_key: { on_delete: :cascade }
      t.references :workspace, index: true, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
