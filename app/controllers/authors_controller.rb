class AuthorsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :author_not_valid
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end

  def author_not_valid(invalid)
    render json: {errors: invalid.record.errors}, status: 422
  end
  
end
