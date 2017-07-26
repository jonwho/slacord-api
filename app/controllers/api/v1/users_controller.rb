class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.create(user_params)
    if user.save
      render json: User.find(user.id), status: :created
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { errors: ["could not find user with id #{params[:id]}"] }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end
