class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name, :password

  def mood
    if self.happiness && self.nausea
      self.nausea > self.happiness ? "sad" : "happy"
    end
  end
  
end
