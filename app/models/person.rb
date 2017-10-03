class Person < ApplicationRecord

  def self.update_count(person, action, date_now, last_date)
    if action == "swears"
          if date_now != last_date 
              person.update_attribute(:swears_today, 0)
          else
              person.update_attribute(:swears_today, person.swears_today + 1)
              person.update_attribute(:swears, person.swears + 1)
          end
          
      else
          if date_now != last_date 
              person.update_attribute(:hacks_today, 0)
          else
              person.update_attribute(:hacks_today, person.hacks_today + 1)
              person.update_attribute(:hacks, person.hacks + 1)
          end
          
      end
  end

end
