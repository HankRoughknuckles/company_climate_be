# typed: true
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render json: @companies, status: :ok
  end

  def show
    @company = Company.find(params[:id])
    render json: @company.to_json(include: :tasks), status: :ok
  end
end
