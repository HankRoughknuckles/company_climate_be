# typed: true
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    render json: @company.to_json(include: :tasks), status: :ok
  end
end
