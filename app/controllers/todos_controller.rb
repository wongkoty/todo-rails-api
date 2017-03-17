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

  def destroy
    Todo.find(params[:id]).destroy
    @lists = [];
    List.includes(:todo).each do |list|
      @lists << {
        list: list,
        todo: list.todo
      }
    end
    render json: {status: 204, lists: @lists}
  end

  private

    def todo_params
      params.require(:todo).permit(:text)
    end
end
