class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def resolve
    if user.admin? || user.moderator?
      scope.all
    elsif user.present?
      scope.where(:user_id => user.id)
    end
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end


  # def update?
  #   user.admin? or not post.published?
  # end
end
