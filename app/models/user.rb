class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  validates_presence_of :name, :password

  def mood
    self.nausea > self.happiness ? "sad" : "happy"
  end
end
