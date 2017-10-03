class StaticController < ApplicationController
  before_action :authenticate_admin
  before_action :authenticate_user!

  def authenticate_admin
      redirect_to '/users/sign_in' unless current_user && access_whitelist
  end


  def home
      @people = Person.all.order(id: :asc)
      datetime_now = DateTime.now.to_s
      puts Person.update_week datetime_now
  end

  def update
      person_params = params.require(:person).permit(:id, :action)
      id = person_params[:id]
      person = Person.find(id)
      date = person.updated_at.to_s
      last_date = date.split(" ")[0]
      datetime_now = DateTime.now.to_s
      # date_now = datetime_now.split("T")[0]
      date_now = "2017-10-09"
      puts date_now
      Person.update_count(person, person_params[:action], date_now, last_date)

      redirect_to "/"
  end

  private
    def access_whitelist
      current_user.try(:admin?) || current_user.try(:door_super?)
    end

end