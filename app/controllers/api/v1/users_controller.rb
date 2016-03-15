class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_user
  before_action :authorize_user

  def show
    user = User.find(params[:id])
    render json: user.to_json, status: 200
  end

  def index
    users = User.all
    render json: users.to_json, status: 200
  end

  def update
    user = User.find(params[:id])

    if user.update_attributes(user_params)
      render json: user.to_json, status: 200
    else
      render json: {error: 'User update failed', status: 400}, status: 400
    end
  end

  def create
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :role)
  end
end

# curl -H "Content-type: application/json" -H "Authorization: Token /HfHktDdsLK+ro8mEWKbXnOpLMM+E6jkkmOyOB9PoVzNW4zIt/y9hkY1oEmANrUAn8LqdFFpN+fDxyK6wax+eA=="" -X PUT -d '{"user": {"name":"Billy Bob", "password":"helloworld"}}' http://localhost:3000/api/v1/users/1/
