class CeasersController < ApplicationController
  before_action :set_ceaser, only: [:show, :edit, :update, :destroy, :encode]

  # GET /ceasers
  def index
    @ceasers = Ceaser.all
  end

  # GET /ceasers/1
  def show
    Rails.logger.warn 'PARAMS: ' + params.to_s
    @encoded_message = flash[:result]
  end

  # GET /ceasers/new
  def new
    @ceaser = Ceaser.new
  end

  # GET /ceasers/1/edit
  def edit; end

  # POST /ceasers
  def create
    @ceaser = Ceaser.new(ceaser_params)

    if @ceaser.save
      redirect_to @ceaser, notice: 'Ceaser was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ceasers/1
  def update
    if @ceaser.update(ceaser_params)
      redirect_to @ceaser, notice: 'Ceaser was successfully updated.', status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /ceasers/1
  def destroy
    @ceaser.destroy!
    redirect_to ceasers_path, notice: 'Ceaser was successfully destroyed.', status: :see_other
  end

  def encode
    redirect_to @ceaser, notice: 'Encoded!', flash: { result: @ceaser.encode(params[:message]) }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ceaser
    @ceaser = Ceaser.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def ceaser_params
    params.fetch(:ceaser, {}).permit(:shift, :message)
  end
end
