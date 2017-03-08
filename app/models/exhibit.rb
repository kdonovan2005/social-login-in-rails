class Exhibit < ActiveRecord::Base

  def self.search(search)
    if search != '' && search != nil
      search = search[0,2]
      if search.length == 1
        search = search.prepend('0')
      end
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

  def display_name
    id = self.id
    entry = Exhibit.find(id)
    "#{entry.entry_code} - #{entry.entry_name} from #{entry.entrant_name}"
  end

end
