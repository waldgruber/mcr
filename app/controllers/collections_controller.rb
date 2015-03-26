class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy, :learn, :show_including_answers]

  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  def show_including_answers
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end
  
  def learn
    unless Representment.where(collection_id: @collection.id).any?
      Question.where(collection_id: @collection.id).each do |question|
        Representment.create(collection_id: @collection.id, 
                             question_id: question.id,
                             rate: @collection.rep) 
      end
    end
    latest_entry_date = Representment.where(collection_id: @collection.id).maximum(:created_at)
    Question.where(created_at: (latest_entry_date..Time.now), 
                   collection_id: @collection.id)
            .each do |question| 
      Representment.create(collection_id: @collection.id, 
                           question_id: question.id, 
                           rate: @collection.rep) 
     end
    
    random_question_number = rand(Representment.where(collection_id: @collection.id).count)
#      if rand(3) == 0 
#        rand(Question.where(collection_id: @collection.id).count)
#      else
#        rand(Representment.where(collection_id: @collection.id).count)
#      end
      
    question_id = Representment.where(collection_id: @collection.id)[random_question_number].question_id
    
    redirect_to ask_question_path(question_id) 
  end

  # POST /collections
  # POST /collections.json
  def create
    @collection = Collection.new(collection_params)

    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:name, :rep)
    end
end
