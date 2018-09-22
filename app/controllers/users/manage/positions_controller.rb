module Users
  module Manage
    class PositionsController < UsersController
      before_action :set_position, only: %i[show edit update destroy]

      def index
        @positions = Position.by_company(params[:company_id])
      end

      def show; end

      def new
        @position = Position.new
      end

      def edit; end

      def create
        @position = Position.new(position_params)
        respond_to do |format|
          if @position.save
            format.html { redirect_to @position, notice: 'Position was successfully created.' }
          else
            format.html { render :new }
          end
        end
      end

      def update
        respond_to do |format|
          if @position.update(position_params)
            format.html { redirect_to @position, notice: 'Position was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end

      def destroy
        @position.destroy
        respond_to do |format|
          format.html { redirect_to company_positions_path, notice: 'Position was successfully destroyed.' }
        end
      end

      private

      def set_position
        @position = Position.by_company(params[:company_id]).find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to company_positions_path, notice: 'Record not found!'
      end

      def position_params
        params.require(:position).permit(:id, :title, :attributes)
      end
    end
  end
end
