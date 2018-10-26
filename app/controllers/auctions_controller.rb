class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]

  # GET /auctions
  # GET /auctions.json
  def index
    if current_user.admin?
      @auctions = Auction.all
    else
      @auctions = current_user.auctions
    end
  end

  def team_list
    if params[:auction_id].present?
      @auction = Auction.find(params[:auction_id])
    elsif current_user.admin?
      @auction = Auction.last
    elsif current_user.team_owner?
      @auction = current_user.auctions.last
    end
    if current_user.admin?
      @auction_players = AuctionPlayer.includes(:player).where(auction_id: @auction.id).where.not(bought_by: nil)
    else
      @auction_players = AuctionPlayer.includes(:player).where(auction_id: @auction.id, bought_by: current_user.owned_team.id)
    end
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
    @current_auction_player = @auction.current_auction_player || @auction.auction_players.first
    @current_player = @current_auction_player.player
    @highest_bid = @current_auction_player.highest_bid
    if current_user.team_owner?
      @current_team = current_user.owned_team
      @current_auction_team = @auction.auction_teams.includes(:team, {auction_players: :player})
                                      .where(team_id: @current_team.id).first
    elsif current_user.admin?
      @auction_teams = @auction.auction_teams.includes(:team, {auction_players: :player})
    end
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)

    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:title, :team_list, :team, { team_ids: [] }, :player_ids, :player_list, :player, { player_ids: [] }, :player_ids)
    end
end
