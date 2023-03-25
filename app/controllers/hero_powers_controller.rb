class HeroPowersController < ApplicationController
  before_action :set_hero_power, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry

  # GET /hero_powers
  def index
    @hero_powers = HeroPower.all

    render json: @hero_powers
  end

  # GET /hero_powers/1
  def show
    render json: @hero_power
  end

  # POST /hero_powers
  def create
    @hero_power = HeroPower.create!(hero_power_params)
    render json: @hero_power.hero, serializer: HeroPowersSerializer
  end

  # PATCH/PUT /hero_powers/1
  def update
    @hero_power.update!(hero_power_params)
      render json: @hero_power
  end

  # DELETE /hero_powers/1
  def destroy
    @hero_power.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero_power
      @hero_power = HeroPower.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_power_params
      params.permit(:strength, :hero_id, :power_id)
    end

    def invalid_entry(invalid)
      render json:{errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
