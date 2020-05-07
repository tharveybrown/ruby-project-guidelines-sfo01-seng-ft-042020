module SortBeer
  module ClassMethods
    def sort_menu
      choices = {'by name' => 1, 'by abv' => 2}
      selection = PROMPT.select("How would you like to sort?", choices)
      
      case selection
      when 1
        options = {'A - Z' => 1, 'Z - A' => 2}
        selection1 = PROMPT.select("How would you like to sort?", options)
        case selection1
        when 1
          Beer.sort_beers_by_name_asc
        when 2
          Beer.sort_beers_by_name_desc
        end
      when 2
        options = {'lowest abv' => 1, 'highest abv' => 2}
        selection2 = PROMPT.select("How would you like to sort?", options)
        case selection2
        when 1
          Beer.sort_beers_by_abv_asc
        when 2
          Beer.sort_beers_by_abv_desc
        end
      end
    end
  end
end