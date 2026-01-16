class CreateRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :requests, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
