class NormalizeUsersDomain < ActiveRecord::Migration
  def up
    add_column :users, :domain, :string

    User.find_each {|u|
      u.email_will_change!
      u.save
    }
  end

  def down
    remove_column :users, :domain
  end
end
