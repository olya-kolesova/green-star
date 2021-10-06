class TeamMembersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @team_members = policy_scope(TeamMember).order(created_at: :desc)
    @team_member = TeamMember.new
  end

  def create
    @team_member = TeamMember.new(team_member_params)
    if @team_member.save
      redirect_to team_members_path
    else
      render "index"
    end
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
    params.require(:team_member).permit(:first_name, :last_name, :position, :info, :user_id, :photo)
  end

end
