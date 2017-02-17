class Exhibit < ActiveRecord::Base

  def self.search(search)
    if search != ''
      entry = where("entry_code = '#{search}' ")
      if entry == nil || entry == ''
        "Sorry, we could not find that entry."
        redirect_to root_path
      end
      entry
    else
      return false
    end
  end

end
