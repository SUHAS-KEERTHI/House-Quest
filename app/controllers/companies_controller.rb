class CompaniesController < ApplicationController
  
  before_action :user_signed_in?

  def index
    @companies = Company.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @companies }
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
     flash[:success] = "Company successfully added"
     redirect_to @company
    else
     render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])

    if @company.update_attributes(company_params)
      redirect_to company_path(@company), notice: "Company Updated!"
    else
      @errors = @company.errors.full_messages
      render :edit
    end
  end

  def destroy
    Company.find(params[:id]).destroy
    redirect_to companies_path, notice: "Deleted Company"
  end

  private

  def company_params
    params.require(:company).permit(:name, :website, :address, :year, :revenue, :size, :synopsis)
  end
end