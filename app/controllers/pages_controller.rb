class PagesController < ApplicationController

  def landing
    if user_signed_in?
      @user = current_user
    end

    @topexhibits = Exhibit.order(vote_count: :desc).limit(2)

    respond_to do |format|
      format.html
      format.json { @exhibits = Exhibit.search(params[:search])}
    end
  end

end
