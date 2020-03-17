# frozen_string_literal: true

# @author Datt Dongare
class AccessPolicy # Handles access of an user
  # @param user [User] the user object
  # @return [Boolean] true/false

  def initialize(user)
    @user = user
  end

  # Tells us whether an user is a admin or not
  # @return boolean
  def admin?
    @user.admin?
  end
end
