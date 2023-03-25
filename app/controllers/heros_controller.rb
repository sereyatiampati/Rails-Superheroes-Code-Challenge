class HerosController < ApplicationController
  before_action :set_hero, only: %i[ show update destroy ]
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_entry
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # GET /heros
  def index
    @heros = Hero.all

    render json: @heros
  end

  # GET /heros/1
  def show
    render json: @hero, serializer: EachHeroSerializer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.permit(:name, :super_name)
    end

    def invalid_entry(invalid)
      render json:{errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def not_found
      render json: {error: "Hero not Found"}, status: :not_found
    end
end
