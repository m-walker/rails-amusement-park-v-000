class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  validates_presence_of :user_id, :attraction_id
  
  def take_ride
    if meet_no_requirements
      meet_no_requirements_msg
    elsif not_enough_tickets
      not_enough_tickets_msg
    elsif not_tall_enough
      not_tall_enough_msg
    else
      user.update(:tickets => (user.tickets - attraction.tickets), :nausea => (user.nausea + attraction.nausea_rating), :happiness => (user.happiness + attraction.happiness_rating))
      "Thanks for riding the #{attraction.name}!"
    end
  end


  private
    def not_tall_enough
      user.height < attraction.min_height
    end

    def not_tall_enough_msg
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    end

    def not_enough_tickets
      user.tickets < attraction.tickets
    end

    def not_enough_tickets_msg
      "Sorry. You do not have enough tickets the #{attraction.name}."
    end


    def meet_no_requirements
      not_tall_enough && not_enough_tickets
    end

    def meet_no_requirements_msg
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end


end
