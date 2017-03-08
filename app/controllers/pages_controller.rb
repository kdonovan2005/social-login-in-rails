class PagesController < ApplicationController

  def landing
    if user_signed_in?
      @user = current_user
      @topexhibits = Exhibit.order(vote_count: :desc).limit(3)

      respond_to do |format|
        format.html
        format.json { @exhibits = Exhibit.search(params[:search])}
      end

    else
      redirect_to root_path
    end

  end

  def sorry
    @skip_header = true
    @skip_footer = true
  end

  def all
    @exhibits = Exhibit.all
  end

end
