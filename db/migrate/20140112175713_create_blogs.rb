class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :repo
      t.string :email
      t.string :auth_token

      t.timestamps
    end
  end
end
