class PagesController < ApplicationController

  def landing
    if user_signed_in?
      @user = current_user
    end

    @exhibits = Exhibit.order(vote_count: :desc).limit(2)
  end

end
