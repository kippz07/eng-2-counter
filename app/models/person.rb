class Person < ApplicationRecord

  def self.update_count(person, action, date_now, last_date)
    if action == "swears"

      if date_now != last_date 
          person.update_attribute(:swears_today, 0)
      else
          person.update_attribute(:swears_today, person.swears_today + 1)
          person.update_attribute(:swears_week, person.swears_week + 1)
          person.update_attribute(:swears, person.swears + 1)
      end

      if self.update_week(date_now) == 1
        person.update_attribute(:swears_week, 0)
      end
      
    else

      if date_now != last_date 
          person.update_attribute(:hacks_today, 0)
      else
          person.update_attribute(:hacks_today, person.hacks_today + 1)
          person.update_attribute(:hacks_week, person.hacks_week + 1)
          person.update_attribute(:hacks, person.hacks + 1)
      end

      if self.update_week(date_now) == 1
        person.update_attribute(:hacks_week, 0)
      end
      
    end
  end

  def self.update_week date
    date_array = date.split("-")
    month = date_array[1].to_i
    day = date_array[2].to_i
    code = self.calc_day(0, self.month_code(month), 6, day)
  end

  def self.year_code year
    (year + (year / 4)) % 7
  end

  def self.month_code month
    case month
    when 1 
      month_code = 0
    when 2
      month_code = 3
    when 3
      month_code = 3
    when 4
      month_code = 6
    when 5 
      month_code = 1
    when 6
      month_code = 4
    when 7 
      month_code = 6
    when 8
      month_code = 2
    when 9 
      month_code = 5
    when 10
      month_code = 0
    when 11 
      month_code = 3
    when 12
      month_code = 5
    end
    month_code
  end

  def self.calc_day(year, month, century, day)
    (year + month + century + day) % 7
  end

  def self.get_swears_day
    people = Person.all.order(swears_today: :desc)
    max_swears = people.first.swears_today
    people.where(swears_today: max_swears)
  end

  def self.get_swears_week
    people = Person.all.order(swears_week: :desc)
    max_swears = people.first.swears_week
    people.where(swears_week: max_swears)
  end

  def self.get_swears_total
    people = Person.all.order(swears: :desc)
    max_swears = people.first.swears
    people.where(swears: max_swears)
  end

end
