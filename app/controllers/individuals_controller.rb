class IndividualsController < ApplicationController
  before_action :set_investigator, only: %i[ show edit update destroy ]

  # GET /individuals or /individuals.json
  def index
    byebug
    @q = Individual.ransack(params[:q])
    @q.combinator = 'or'
    @individuals = @q.result
  end

  def search
    index
    render :index
  end

  # GET /individuals/1 or /individuals/1.json
  def show
  end

  # GET /individuals/new
  def new
    @individual = Individual.new
  end

  # GET /individuals/1/edit
  def edit
  end

  # POST /individuals or /individuals.json
  def create
    byebug
    @individual = Individual.new(investigator_params)

    respond_to do |format|
      if @individual.save
        format.html { redirect_to individual_url(@individual), notice: "Individual was successfully created." }
        format.json { render :show, status: :created, location: @individual }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /individuals/1 or /individuals/1.json
  def update
    respond_to do |format|
      if @individual.update(investigator_params)
        format.html { redirect_to individual_url(@individual), notice: "Individual was successfully updated." }
        format.json { render :show, status: :ok, location: @individual }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @individual.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /individuals/1 or /individuals/1.json
  def destroy
    @individual.destroy

    respond_to do |format|
      format.html { redirect_to individuals_url, notice: "Individual was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investigator
      @individual = Individual.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investigator_params
      params.require(:individual).permit(:first_name, :last_name, :id_card, :email, :individual_type)
    end
end
