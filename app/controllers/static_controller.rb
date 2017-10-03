class StaticController < ApplicationController

    def home
        @people = Person.all.order(id: :asc)
    end

    def update
        person_params = params.require(:person).permit(:id, :action)
        id = person_params[:id]
        person = Person.find(id)
        date = person.updated_at.to_s
        last_date = date.split(" ")[0]
        datetime_now = DateTime.now.to_s

        date_now = datetime_now.split("T")[0]
        # date_now = "2017/10/03"

        if person_params[:action] == "swears"
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

        redirect_to "/"
    end

end