class AddImageColumnToPepes < ActiveRecord::Migration
  def up
    add_attachment :pepes, :image
  end

  def down
    remove_attachment :pepes, :image
  end
end
