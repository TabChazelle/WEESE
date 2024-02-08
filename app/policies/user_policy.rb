class UserPolicy < ApplicationPolicy
  def favorites?
    user == record
  end
end
