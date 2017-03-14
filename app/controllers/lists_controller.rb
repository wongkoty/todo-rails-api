class ListsController < ApplicationController
  def index
    # render json: 'index of lists'
    @test = [];
    @lists = List.all;

    @lists.each do |list| 
      @test << {
        list: list,
        todo: list.todo
      }
    end
    render json: {lists: @test}
  end

  def show 
    puts List.find(params[:id]).todo
    render json: List.find(params[:id]), json: List.find(params[:id]).todo
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
    render json: {status: 204}
  end


  private 

    def list_params
      params.require(:list).permit(:title,)
    end

end
