class TranscriptsController < ApplicationController
  # GET /transcripts
  # GET /transcripts.json
  def index
    @transcripts = Transcript.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @transcripts }
    end
  end

  # GET /transcripts/1
  # GET /transcripts/1.json
  def show
    @transcript = Transcript.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transcript }
    end
  end

  # GET /transcripts/new
  # GET /transcripts/new.json
  def new
    @transcript = Transcript.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transcript }
    end
  end

  # GET /transcripts/1/edit
  def edit
    @transcript = Transcript.find(params[:id])
  end

  # POST /transcripts
  # POST /transcripts.json
  def create
    @transcript = Transcript.new(params[:transcript])

    respond_to do |format|
      if @transcript.save
        format.html { redirect_to @transcript, notice: 'Transcript was successfully created.' }
        format.json { render json: @transcript, status: :created, location: @transcript }
      else
        format.html { render action: "new" }
        format.json { render json: @transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /transcripts/1
  # PUT /transcripts/1.json
  def update
    @transcript = Transcript.find(params[:id])

    respond_to do |format|
      if @transcript.update_attributes(params[:transcript])
        format.html { redirect_to @transcript, notice: 'Transcript was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transcript.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcripts/1
  # DELETE /transcripts/1.json
  def destroy
    @transcript = Transcript.find(params[:id])
    @transcript.destroy

    respond_to do |format|
      format.html { redirect_to transcripts_url }
      format.json { head :no_content }
    end
  end
end
