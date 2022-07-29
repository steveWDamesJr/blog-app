class Ability
  include CanCan::Ability
  def user
    @user = current_user
  end
end
