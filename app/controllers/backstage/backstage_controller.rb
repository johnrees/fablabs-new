class Backstage::BackstageController < ApplicationController

  before_filter :require_superadmin
  layout 'backstage'

private

  def require_superadmin
    if current_user
      unless current_user.is_superadmin?
        return redirect_to root_url, notice: "not authorized"
      end
    else
      return redirect_to login_url
    end
  end

end