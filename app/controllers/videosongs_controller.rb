  class VideosongsController < ApplicationController
  before_action :set_videosong, only: [:show, :edit, :update, :destroy]

  # GET /videosongs
  # GET /videosongs.json
  def index
    @videosongs = Videosong.all
  end

  # GET /videosongs/1
  # GET /videosongs/1.json
  def show
  end

  # GET /videosongs/new
  def new
    @videosong = Videosong.new
  end

  # GET /videosongs/1/edit
  def edit
  end

  # POST /videosongs
  # POST /videosongs.json
  def create
    @videosong = Videosong.new(videosong_params)

    respond_to do |format|
      if @videosong.save
        format.html { redirect_to @videosong, notice: 'Videosong was successfully created.' }
        format.json { render action: 'show', status: :created, location: @videosong }
      else
        format.html { render action: 'new' }
        format.json { render json: @videosong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videosongs/1
  # PATCH/PUT /videosongs/1.json
  def update
    respond_to do |format|
      if @videosong.update(videosong_params)
        format.html { redirect_to @videosong, notice: 'Videosong was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @videosong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videosongs/1
  # DELETE /videosongs/1.json
  def destroy
    @videosong.destroy
    respond_to do |format|
      format.html { redirect_to videosongs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_videosong
      @videosong = Videosong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def videosong_params
      params.require(:videosong).permit(:video_url, :song_url, :likes)
    end
end
