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
    if  params[:reservation][:applicantlastname] && params[:reservation][:applicantfirstname]
      @reserve.applicantname = params[:reservation][:applicantlastname] + params[:reservation][:applicantfirstname]
    end
    @reserve.save
    flash[:success] = "葬儀予約を新規登録しました。"
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
    if  params[:reservation][:applicantlastname] && params[:reservation][:applicantfirstname]
      @reserve.applicantname = params[:reservation][:applicantlastname] + params[:reservation][:applicantfirstname]
    end
    @reserve.update(reserve_params)
     flash[:success] = "葬儀予約を編集しました。"
   redirect_to edit_reservation_url(@reserve)
  end

  private
  
  def reserve_params
    params.require(:reservation).permit(:date, :member_id, :classification,
                            :lastname, :firstname, :namekana,
                            :city, :streetadress, :relation,
                            :hospital,:ceremonial1,:ceremonial2,:ceremonial3,
                            :plan, :lower, :other, :applicantlastname,:applicantkana,:applicantfirstname)
  end
end
