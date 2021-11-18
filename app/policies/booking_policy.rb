class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope.joins(booking: :market).where("markets.user_id = #{user} OR bookings.user_id = #{user}")
      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)


      scope.where(user: user)
    end
  end



  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end

end
