module V1
  class TodosController < ApplicationController
    # GET /todos
    def index
      @todos = current_user.todos.paginate(page: params[:page], per_page: 20)
      json_response(@todos)
    end
  
  #   # POST /todos
  #   def create
  #     @todo = current_user.todos.create!(todo_params)
  #     json_response(@todo, :created)
  #   end
  
  #   private
  
  #   def todo_params
  #     # whitelist params
  #     params.permit(:title)
  #   end
  # end
end