module Users
  module Manage
    class CompaniesController < UsersController
      before_action :set_company, only: %i[show edit update destroy]

      def index
        @companies = Company.owner(current_user)
      end

      def show; end

      def new
        @company = Company.new
      end

      def edit; end

      def create
        @company = Company.new(company_params)
        @company.user = current_user
        respond_to do |format|
          if @company.save
            format.html { redirect_to @company, notice: 'Company was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end

      def update
        respond_to do |format|
          if @company.update(company_params)
            format.html { redirect_to @company, notice: 'Company was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end

      def destroy
        @company.destroy
        respond_to do |format|
          format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
        end
      end

      private

      def set_company
        @company = Company.owner(current_user).find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to companies_url, notice: 'Record not found!'
      end

      def company_params
        params.require(:company).permit(:id, :unp, :name)
      end
    end
  end
end
