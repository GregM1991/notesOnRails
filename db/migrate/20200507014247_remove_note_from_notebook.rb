class RemoveNoteFromNotebook < ActiveRecord::Migration[6.0]
  def change
    remove_reference :notebooks, :note, null: false, foreign_key: true
  end
end
