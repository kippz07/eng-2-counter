class StaticController < ApplicationController

    def home
        @people = Person.all
    end

    def update
        person_params = params.require(:person).permit(:id, :count, :action)
        id = person_params[:id]
        person = Person.find(id)
        if (person_params[:action] == "swears")
            person.update_attribute(:swears, person_params[:count].to_i + 1)
        else
            person.update_attribute(:hacks, person_params[:count].to_i + 1)
        end
        redirect_to "/"
    end

end