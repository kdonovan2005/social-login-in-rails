class PagesController < ApplicationController

  def landing
    if user_signed_in?
      @user = current_user
    end

    @topexhibits = Exhibit.order(vote_count: :desc).limit(3)

    respond_to do |format|
      format.html
      format.json { @exhibits = Exhibit.search(params[:search])}
    end
  end

  def sorry
    @skip_footer = true
  end

end
