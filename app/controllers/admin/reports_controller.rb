class Admin::ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index

    if params[:latest]
      @reports = Report.latest.page(params[:page])
    elsif params[:old]
      @reports = Report.old.page(params[:page])
    elsif params[:star_count]
      @reports = Report.star_count.page(params[:page])
    else
      @reports = Report.all.page(params[:page])
    end

  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:notice] = "対応ステータスを更新しました。"
      redirect_to request.referer
    end
  end

  private

  def report_params
    params.require(:report).permit(:status)
  end
end
