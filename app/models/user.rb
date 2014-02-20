class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email

private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
