class TeamMembersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @team_members = TeamMember.all
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    if @team_member.save
      redirect_to team_members_path
    else
      render "index"
  end

  def update
    @team_member = TeamMember.find(params[:id])
    @team_member.update(team_member_params)
  end

  def destroy
    @team_member = TeamMember.find(params[:id])
    @team_member.destroy
  end

  def team_member_params
    params.require(:team_member).permit[:first_name, :last_name, :position, :info]
  end

end
end
