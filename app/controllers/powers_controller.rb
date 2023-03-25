class PowersController < ApplicationController
  before_action :set_power, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /powers
  def index
    @powers = Power.all

    render json: @powers
  end

  # GET /powers/1
  def show
    render json: @power
  end

  # POST /powers
  def create
    @power = Power.create!(power_params)
    render json: @power
  end

  # PATCH/PUT /powers/1
  def update
    @power.update!(power_params)
    render json: @power

  end

  # DELETE /powers/1
  def destroy
    @power.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_power
      @power = Power.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def power_params
      params.permit(:name, :description)
    end

    def not_found
      render json: {error: "Power not Found"}, status: :not_found
    end

    def invalid_entry(invalid)
      render json:{errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
