class ReservationsController < ApplicationController
  #葬儀予約
  def index
    @reservations = Reservation.page(params[:page])
  end
  
  def new
    @reserve = Reservation.new
    if params[:member_id]
      @member = Member.find(params[:member_id])
      @reserve.city = @member.city
      @reserve.member_id = @member.id
      @reserve.streetadress = @member.streetaddress
    end
  end
  
  
  def create
    @reserve = Reservation.new(reserve_params)
    @reserve.name =  @reserve.lastname + @reserve.firstname
    @reserve.save
    redirect_to edit_reservation_url(@reserve)
  end
  
  def edit 
    @reserve = Reservation.find(params[:id])
    if @reserve.member_id.present?
      @member = Member.find(@reserve.member_id)
    end
  end

  def update
    @reserve = Reservation.find(params[:id])
    @reserve.name = params[:reservation][:lastname] + params[:reservation][:firstname]
    @reserve.update(reserve_params)
    redirect_to edit_reservation_url(@reserve)
  end

  private
  
  def reserve_params
    params.require(:reservation).permit(:date, :member_id, :classification,
                            :lastname, :firstname, :namekana,
                            :city, :streetadress, :relation,
                            :hospital,:ceremonial1,:ceremonial2,:ceremonial3,
                            :plan, :lower, :other)
  end
end
