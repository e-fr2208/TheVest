class ReadingPolicy < ApplicationPolicy
	attr_reader :user, :reading
  class Scope < Scope
  	attr_reader :user, :reading

  	def initialize(user, reading)
  		@user = user
  		@reading = reading
  	end

    def resolve
      reading
    end
  end



  def index?
  	show?
  end

  def show?
 	super
  end

  def update?
  	show?
  end

  def destroy?
  	show?
  end
end
