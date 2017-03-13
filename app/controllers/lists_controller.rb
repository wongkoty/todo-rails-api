class ListsController < ApplicationController
  def index
    render json: 'index of lists'
    lists = List.all;
  end
end
