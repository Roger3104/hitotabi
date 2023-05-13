class Public::ReportsController < ApplicationController

  def new
    @report = Report.new
    @user = User.find(params[:format])
  end

  def create
    @user = User.find(params[:id])
    @report = Report.new(report_params)
    @report.reporter_id = current_user.id
    @report.reported_id = @user.id
    if @report.save
      redirect_to user_path(@user), notice: "ご報告ありがとうございます"
    else
      render "new"
    end
  end



  private

  def report_params
    params.require(:report).permit(:reason, :url)
  end
end
