class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  def search
   # @rooms = Room.all.select { |y| y.building ==params[:building] and y.size ==params[:size]}
    x = params[:booking_date].split("/").to_a
    dateField = Date.new(x[2].to_i,x[0].to_i,x[1].to_i)

    bookedReservations = Reservation.select("room_id").where("cast(booking_date as date) = :booking_date AND cast(start_time as text) = :start_time AND cast(end_time as text) = :end_time AND cast(status as text) = :status",{ booking_date: dateField ,start_time: params[:start], end_time: params[:end],status:'booked'})

    @rooms = Room.where("cast(building as text) = :building AND cast(size as text) = :size", {building: params[:building], size: params[:size]}).where.not(id: bookedReservations)

  end

  def search_user
    # @rooms = Room.all.select { |y| y.building ==params[:building] and y.size ==params[:size]}
    x = params[:booking_date].split("/").to_a
    dateField = Date.new(x[2].to_i,x[0].to_i,x[1].to_i)

    bookedReservations = Reservation.select("room_id").where("cast(booking_date as date) = :booking_date AND cast(start_time as text) = :start_time AND cast(end_time as text) = :end_time AND cast(status as text) = :status",{ booking_date: dateField ,start_time: params[:start], end_time: params[:end],status:'booked'})

    @rooms = Room.where("cast(building as text)  = :building AND cast(size as text)  = :size", {building: params[:building], size: params[:size]}).where.not(id: bookedReservations)

  end


  def reserve

    #plz check if still available
    @reservation = params[:reservation]
    @reservation.user_id = current_user.id
    @reservation.save
    redirect_to '/'+ User.find(current_user.id).role.to_s + '/home'
  end


  def reserve_user

    #plz check if still available
    @reservation = params[:reservation]
    @reservation.save
    redirect_to '/'+ User.find(current_user.id).role.to_s + '/home'
  end

  def release
    puts 'Release called'
    @reservation = Reservation.find(params[:id])
    @reservation.status= 'released'

    @reservation.save
    redirect_to '/'+ User.find(current_user.id).role.to_s + '/home', notice: " Reservation has been Released!"

  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  def home
    @currentReservations = Reservation.all.select {|y| y.booking_date > Date.today and y.user_id == current_user.id and y.status == 'booked'} + Reservation.all.select { |y| y.user_id == current_user.id and y.status == 'booked' and y.booking_date == Date.today and y.start_time > Time.now.hour.to_s() }
    @pastReservations = Reservation.all.select {|y| y.booking_date < Date.today and y.user_id == current_user.id} + Reservation.all.select {|y| y.user_id == current_user.id and y.booking_date == Date.today and y.start_time < Time.now.hour.to_s() }
  end

=begin
  def home
    @currentReservations = Reservation.all.select { |y| y.user_id == current_user.id and y.status == 'booked' and y.booking_date > Date.today } + Reservation.all.select { |y| y.user_id == current_user.id and y.status == 'booked' and y.booking_date == Date.today and y.end_time > Time.now.hour.to_s() }
    @pastReservations = Reservation.all.select { |y| y.user_id == current_user.id and y.booking_date < Date.today } + Reservation.all.select {|y| y.user_id == current_user.id and y.booking_date == Date.today and y.start_time < Time.now.hour.to_s() and y.end_time <= Time.now.hour.to_s() }
  end
=end

  # POST /reservations
  # POST /reservations.json
  def create
    puts 'create'
    #@room = Reservation.new(reservation_params)
    require 'date'

    new_params= {}
    x = params[:reservation][:booking_date].split("/").to_a
    dateField = Date.new(x[2].to_i,x[0].to_i,x[1].to_i)
    new_params[:booking_date] = dateField
    new_params[:start_time] = params[:reservation][:start_time]
    new_params[:end_time] = params[:reservation][:end_time]
    new_params[:status] = 'booked'
    new_params[:room_id] = params[:room]

    if User.find(current_user.id).role == 'user'
        new_params[:user_id] = current_user.id
    else
       new_params[:user_id] = params[:reservation][:user_id]
    end

    puts new_params.to_s
    @reservation = Reservation.new(new_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reservation }
      else
        puts 'errors'
        puts @reservation.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
    end

=begin
    @reservation = Reservation.new(params[:reservation])
    @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reservation }
      else
        format.html { render action: 'new' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
=end


  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url }
      format.json { head :no_content }
    end
  end

  def reserve
    respond_to do |format|
      format.html { redirect_to reserve }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
     params.require(:reservation).permit(:booking_date,:start_time,:end_time,:room_id)
    end

end
