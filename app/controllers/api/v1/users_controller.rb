class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.create(user_params)
    if user.save
      render json: User.find(user.id)
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end
  end

  def show
    respond_with User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
