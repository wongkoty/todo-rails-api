class ListsController < ApplicationController
  def index
    # render json: 'index of lists'
    @lists = List.all;
    render json: @lists
  end

  def show 
    render json: List.find(params[:id])
  end

  def create 
    puts 'create'
    @list = List.new(list_params)
    puts params

    if @list.save
      puts 'saved'
      render json: @list, status: :created
    else
      render json: !list.errors, status: :unprocessable_entity
    end
  end

  private 

    def list_params
      params.require(:list).permit(:title,)
    end

end
