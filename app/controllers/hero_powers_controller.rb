class HeroPowersController < ApplicationController
  before_action :set_hero_power, only: %i[ show update destroy ]

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
    @hero_power = HeroPower.new(hero_power_params)

    if @hero_power.save
      render json: @hero_power, status: :created, location: @hero_power
    else
      render json: @hero_power.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hero_powers/1
  def update
    if @hero_power.update(hero_power_params)
      render json: @hero_power
    else
      render json: @hero_power.errors, status: :unprocessable_entity
    end
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
      params.fetch(:hero_power, {})
    end
end
