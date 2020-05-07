class AddNotebookToNote < ActiveRecord::Migration[6.0]
  def change
    add_reference :notes, :notebook, null: false, foreign_key: true
  end
end
