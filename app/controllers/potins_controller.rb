class PotinsController < ApplicationController
  
  
  def show
    gossip_chosen
  end

  def index
    all_gossips
  end

  def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
   @new_gossip = Potin.new() #Cette ligne est important car, pour la première fois, elle fournit un nouveau potin sans erreur à la view, qui vérifie que c'est bien le cas.
  end

  def create
    # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params (ton meilleur pote)
    # Une fois la création faite, on redirige généralement vers la méthode show (pour afficher le potin créé)

   all_gossips #On le remet pour que la view index, qui en a besoin, puisse afficher ce qu'elle doit afficher

    @new_gossip = Potin.new(title: params[:title],content: params[:content])
    @new_gossip.user = User.first
    if @new_gossip.save     #Si la sauvegarde dans la DB se fait alors:
      render "index.html.erb"  #Render renvoie vers une view et garde les params en mémoire afin que nous puissions les utiliser dans le view
    else
      render "new.html.erb" #Si ça ne marche pas, on te laisse sur la page du formulaire
    end
  end


  def edit
    gossip_chosen
  end


  def update
    gossip_chosen
    post_params
    if @gos.update(@post_params)
      redirect_to @gos
    else 
      render :edit
    end
  end

  def destroy
    gossip_chosen
    @gos.destroy
    redirect_to potins_path
  end

  private

  def gossip_chosen
  @gos = Potin.find(params[:id])
  end

  def all_gossips
    @all_gossips = Potin.all
  end

  def post_params
    @post_params = params.require(:potin).permit(:title, :content)
  end
end

