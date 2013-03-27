class MakeFirstUserAdmin < ActiveRecord::Migration
  def up
    first_user = User.first
    first_user.update_attribute(:admin, true)
  end

  def down
  end
end
