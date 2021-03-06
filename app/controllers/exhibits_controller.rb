class ExhibitsController < ApplicationController
  autocomplete :exhibit, :entry_code, :display_value => :display_name

  def index
    if user_signed_in?
      @topexhibits = Exhibit.order(vote_count: :desc).limit(3)
      @exhibits = Exhibit.all
      @exhibit = Exhibit.search(params[:search])
      if @exhibit == [] || @exhibit == false
        flash[:notice] = "Sorry, that is not a valid entry number."
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def show
  end

  def update
    if user_signed_in?
      @exhibit = Exhibit.find(params[:id])
      @exhibit.vote_count += 1
      @exhibit.save
      current_user.vote = false
      if current_user.email == nil
        current_user.save(:validate => false)
      else
        current_user.save
      end
      # flash[:notice] = "Thank you for voting for #{@exhibit.entry_name}"
      redirect_to exhibits_path
    else
      redirect_to root_path
    end
  end

end
