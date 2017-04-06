  class TaskCategoriesController < ApplicationController
    #before_action :set_task_category, only: [:show, :update, :destroy]
    before_action :authenticate_request!

    # GET /task_categories
    def index
      @task_categories = @current_user.task_categories

      render json: @task_categories
    end

    # GET /task_categories/1
    def show
      render json: @task_category
    end

    # POST /task_categories
    def create
      @task_category = TaskCategory.new(task_category_params)
      @current_user.task_categories << @task_category

      if @task_category.save
        render json: @task_category, status: :created, location: @task_category
      else
        render json: @task_category.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /task_categories/1
    def update
      if @task_category.update(task_category_params)
        render json: @task_category
      else
        render json: @task_category.errors, status: :unprocessable_entity
      end
    end

    # DELETE /task_categories/1
    def destroy
      @task_category.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_category
      @task_category = TaskCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_category_params
      params.require(:task_category).permit(:name)
    end
  end

