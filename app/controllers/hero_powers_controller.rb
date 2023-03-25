class HeroPowersController < ApplicationController
  before_action :set_hero_power, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry


  # POST /hero_powers
  def create
    @hero_power = HeroPower.create!(hero_power_params)
    render json: @hero_power.hero, serializer: HeroPowersSerializer
  end

  private
    # Only allow a list of trusted parameters through.
    def hero_power_params
      params.permit(:strength, :hero_id, :power_id)
    end

    def invalid_entry(invalid)
      render json:{errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
