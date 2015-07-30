class CompanyVacanciesController < ApplicationController
  before_action :set_company_vacancy, only: [:show, :edit, :update, :destroy]

  # GET /company_vacancies
  # GET /company_vacancies.json
  def index
    @company_vacancies = CompanyVacancy.all
  end

  # GET /company_vacancies/1
  # GET /company_vacancies/1.json
  def show
  end

  # GET /company_vacancies/new
  def new
    @company_vacancy = CompanyVacancy.new
  end

  # GET /company_vacancies/1/edit
  def edit
  end

  # POST /company_vacancies
  # POST /company_vacancies.json
  def create
    @company_vacancy = CompanyVacancy.new(company_vacancy_params)

    respond_to do |format|
      if @company_vacancy.save
        format.html { redirect_to @company_vacancy, notice: 'Company vacancy was successfully created.' }
        format.json { render :show, status: :created, location: @company_vacancy }
      else
        format.html { render :new }
        format.json { render json: @company_vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_vacancies/1
  # PATCH/PUT /company_vacancies/1.json
  def update
    respond_to do |format|
      if @company_vacancy.update(company_vacancy_params)
        format.html { redirect_to @company_vacancy, notice: 'Company vacancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_vacancy }
      else
        format.html { render :edit }
        format.json { render json: @company_vacancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_vacancies/1
  # DELETE /company_vacancies/1.json
  def destroy
    @company_vacancy.destroy
    respond_to do |format|
      format.html { redirect_to company_vacancies_url, notice: 'Company vacancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_vacancy
      @company_vacancy = CompanyVacancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_vacancy_params
      params.require(:company_vacancy).permit(:company_id, :title, :salary, :requirements, :description)
    end
end
