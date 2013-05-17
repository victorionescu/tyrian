class OfficersController < ApplicationController
  def index
    @members = {}

    MEMBERSHIPS.each do |membership|
      member = Member.where("membership='#{membership}'").first

      @members[membership] = member
    end
  end
end
