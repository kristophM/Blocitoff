class ItemPolicy < ApplicationPolicy
  def destroy?
    user.present? && record.user == user
  end
end
