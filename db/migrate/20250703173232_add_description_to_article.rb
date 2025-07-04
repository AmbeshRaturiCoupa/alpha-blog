class AddDescriptionToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :description, :text
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
