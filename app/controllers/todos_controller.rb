class TodosController < ApplicationController
  def index
    render json: Todo.all
  end

  def show
    render json: Todo.find(params[:id])
  end

  def update 
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      render json: @todo, status: 200
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end
