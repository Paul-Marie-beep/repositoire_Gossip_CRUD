class HomeController < ApplicationController
 
 
 
 
  def show

    @all_potins = Potin.all
    @potin_exemple_1 = Potin.first
    @potin_exemple_2 = Potin.last
    


  end
end
