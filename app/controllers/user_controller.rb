class UserController < ApplicationController
  def show

    @author = User.find(params[:id])

  end

  def new
    @new_author = User.new
  end

  def create
    puts "$" * 60
    puts params
    puts "$" * 60

    @new_author = User.new(first_name: params[:first_name], last_name: params[:last_name], 
    email: params[:email], description: params[:description], password: params[:password])
    @new_author.city = City.find_by(name: params[:city])
    @new_author.age = params[:age].to_i
    if @new_author.save
      #Pour le flash, il faut rajouter une ligne de code dans le fichier view application.html.rb
      flash[:success] = "Profil utilisateur bien créé !"
      redirect_to root_path
    else
      flash.now[:danger] = "Nous n'avons pas pu créer votre profil. Merci de réessayer"
      render :new  
    end

  end

end