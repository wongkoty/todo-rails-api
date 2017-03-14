class ListsController < ApplicationController
  def index
    @lists = [];
    List.includes(:todo).each do |list|
      @lists << {
        list: list,
        todo: list.todo
      }
    end
    render json: {lists: @lists}
  end

  def show 
    list = List.includes(:todo).find(params[:id])
    render json: {
            list: list,
            todos: list.todo
          }
  end

  def create 
    puts 'create'
    @list = List.new(list_params)
    # puts params

    if @list.save
      puts 'saved'
      render json: @list, status: :created
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: @list, status: :updated
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    List.find(params[:id]).destroy
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

    def list_params
      params.require(:list).permit(:title,)
    end

end
