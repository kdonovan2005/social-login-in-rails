class ExhibitsController < ApplicationController
  autocomplete :exhibit, :entry_number, :extra_data => [:entry_name]

  def index
    @topexhibits = Exhibit.order(vote_count: :desc).limit(3)
    @exhibits = Exhibit.all
    @exhibit = Exhibit.search(params[:search])
    if @exhibit == []
      flash[:notice] = "Sorry, that is not a valid entry number."
      redirect_to root_path
    end
  end

  def show
  end

  def update
    @exhibit = Exhibit.find(params[:id])
    @exhibit.vote_count += 1
    @exhibit.save
    current_user.vote = false
    if current_user.email == nil
      current_user.save(:validate => false)
    else
      current_user.save
    end
    redirect_to exhibits_path
  end

end
