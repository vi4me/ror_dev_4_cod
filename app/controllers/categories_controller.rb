# frozen_string_literal: true

class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_action :set_category, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @user = current_user
    @category = @user.categories.create(category_params)
    if @category.persisted?
      flash[:success] = 'category was created'
      redirect_to categories_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
      render :new
    end
  end

  def update
    if @category.update(categories_params)
      flash[:success] = 'category was updated'
      redirect_to category_path
    else
      flash.now[:error] = 'Please fill all fields correctly'
    end
  end

  def destroy
    if @category.destroy.destroyed?
      flash[:success] = 'category was deleted'
      redirect_to categories_path
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :user_id, :appointment_id)
  end
end
