class CitiesController < ApplicationController
  
  
  
  def show
     @city = City.find(params[:id]) 
     @all_gossips = Potin.all
  end
end
