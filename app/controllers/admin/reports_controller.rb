class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!

  def index

    if params[:latest]
      @reports = Report.latest.page(params[:page])
    elsif params[:old]
      @reports = Report.old.page(params[:page])
    elsif params[:waiting]
      @reports = Report.where(status: [:waiting]).page(params[:page])
    elsif params[:keep]
      @reports = Report.where(status: [:keep]).page(params[:page])
    elsif params[:finish]
      @reports = Report.where(status: [:finish]).page(params[:page])
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
