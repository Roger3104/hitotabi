class Admin::ReportsController < ApplicationController

  def index

    if params[:latest]
      @reports = Report.latest
    elsif params[:old]
      @reports = Report.old
    elsif params[:star_count]
      @reports = Report.star_count
    else
      @reports = Report.all
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
