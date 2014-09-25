class Backstage::UsersController < Backstage::BackstageController

  def index
    @users = User.all
  end

end
