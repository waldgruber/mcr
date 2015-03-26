class RepresentmentsController < ApplicationController
  before_action :set_representment, only: [:show, :edit, :update, :destroy]

  # GET /representments
  # GET /representments.json
  def index
    @representments = Representment.all
  end

  # GET /representments/1
  # GET /representments/1.json
  def show
  end

  # GET /representments/new
  def new
    @representment = Representment.new
  end

  # GET /representments/1/edit
  def edit
  end

  # POST /representments
  # POST /representments.json
  def create
    @representment = Representment.new(representment_params)

    respond_to do |format|
      if @representment.save
        format.html { redirect_to @representment, notice: 'Representment was successfully created.' }
        format.json { render :show, status: :created, location: @representment }
      else
        format.html { render :new }
        format.json { render json: @representment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /representments/1
  # PATCH/PUT /representments/1.json
  def update
    respond_to do |format|
      if @representment.update(representment_params)
        format.html { redirect_to @representment, notice: 'Representment was successfully updated.' }
        format.json { render :show, status: :ok, location: @representment }
      else
        format.html { render :edit }
        format.json { render json: @representment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /representments/1
  # DELETE /representments/1.json
  def destroy
    @representment.destroy
    respond_to do |format|
      format.html { redirect_to representments_url, notice: 'Representment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_representment
      @representment = Representment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def representment_params
      params.require(:representment).permit(:user_id, :question_id, :collection_id, :rate)
    end
end
