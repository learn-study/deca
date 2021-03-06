class MembersController < ApplicationController
  before_action :require_user_logged_in
  def show
    @member= Member.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.pdf do
        pdf = OrderPdf.new(@member)

        send_data pdf.render,
          filename:    "member#{@member.id}.pdf",
          type:        "application/pdf",
          disposition: "inline" #dlではなくブラウザ表示
      end
    end
  end
  
  def posSearch
    pos = params[:posNumber]
    if pos.present?
      p "exist" 
      pos.delete!("-")
      pos.delete!("－")
      require 'net/http'
      url = 'http://zipcloud.ibsnet.co.jp/api/search?zipcode=' + pos
      uri = URI.parse(url)
      json = Net::HTTP.get(uri)
      res = JSON.parse(json)
      
      @city = res["results"][0]["address2"]
      @street = res["results"][0]["address3"]
    end
  end
  
  def index
    @member = Member.new #検索用
    @keyword = params[:keyword] #フリー検索
    @tel = params[:tel].to_s #電話番合検索
    @family = params[:family].to_s #家族検索
    @member_id = params[:member_id].to_i if params[:member_id].present?#会員番号
    
    if @keyword.present?
      @keyword.gsub!(/(\s|　)+/, '')
      @member = Member.new
      @members = Member.where("lastname like '%"+@keyword+"%'")
                .or(Member.where("firstname like '%"+@keyword+"%'"))
                .or(Member.where("name like '%"+@keyword+"%'"))
                .or(Member.where("namekana like '%"+@keyword+"%'"))
                .or(Member.where("city like '%"+@keyword+"%'"))
                .or(Member.where("streetaddress like '%"+@keyword+"%'"))
                .or(Member.where("tag like '%"+@keyword+"%'"))
                .page(params[:page])
    elsif @tel.present?
      @tel.gsub!(/(\s|　)+/, '')
      @tel.delete!("-")
      @tel.delete!("－")
      @tel.delete!("ー")
      @member = Member.new
      @members = Member.where("tel like '%"+@tel+"%'")
                .or(Member.where("mobile like '%"+@tel+"%'"))
                .page(params[:page])
    elsif @member_id.present?
      @member = Member.new
      @members = Member.where(id: @member_id)
                .page(params[:page])
    elsif @family.present?
      @family.gsub!(/(\s|　)+/, '')
      @member = Member.new
      @families = Family.where("lastname like '%"+@family+"%'")
                .or(Family.where("firstname like '%"+@family+"%'"))
                .or(Family.where("name like '%"+@family+"%'"))
                .or(Family.where("namekana like '%"+@family+"%'"))
                .page(params[:page])
    elsif params[:form]
      strongwords = "k83!あ1ksoこ"
      @member = Member.new(member_params)
      if params[:flastname].present? or params[:ffirstname].present? or params[:fkana].present?
        params[:flastname].present? ? lastname = params[:flastname] : lastname = strongwords
        params[:ffirstname].present? ? firstname = params[:ffirstname] : firstname = strongwords
        params[:fkana].present? ? kana = params[:fkana] : kana = strongwords
        f = Family.where("lastname like '%"+lastname+"%'")
        .or(Family.where("firstname like '%"+firstname+"%'"))
        .or(Family.where("namekana like '%"+kana+"%'"))
        .pluck(:member_id)
        @members = Kaminari.paginate_array(Member.find(f)).page(params[:page])
        return
      end
      trim(@member.tel)
      #if @mem.tel = "0"
      #  flash.now[:danger] = '電話番号「０」は検索できないワードです。'
      #end
      @member.id.present? ? id = @member.id : id = "-1"
      @member.lastname.present? ? lastname = @member.lastname : lastname = strongwords
      @member.firstname.present? ? firstname = @member.firstname : firstname = strongwords
      @member.namekana.present? ? namekana = @member.namekana : namekana = strongwords
      @member.city.present? ? city = @member.city : city = "123agiargnala5gqpgkqabra"
      @member.streetaddress.present? ? streetaddress = @member.streetaddress : streetaddress = strongwords
      @member.tel.present? ? tel = @member.tel : tel = "aa-"
      @member.kind.present? ? kind = @member.kind : kind = "-cc"
      #@member.dm.present? ? dm = true : dm = ""
      #@member.reserve.present? ? reserve = true : reserve = ""
      @member.tag.present? ? tag = @member.tag : tag = strongwords
      p tel
      #begin
        @members = Member.where(id: id)
               .or(Member.where("lastname like '%"+lastname+"%'"))
               .or(Member.where("firstname like '%"+firstname+"%'"))
               .or(Member.where("namekana like '%"+namekana+"%'"))
               .or(Member.where("city like '%"+city+"%'"))
               .or(Member.where("streetaddress like '%"+streetaddress+"%'"))
               .or(Member.where("tel like '%"+tel+"%'"))
               .or(Member.where(kind: kind))
               .or(Member.where(dm: dm))
               .or(Member.where(reserve: reserve))
               .or(Member.where("tag like '%"+tag+"%'"))
               .page(params[:page])
      #rescue TypeError => ex
        #@members = Member.page(params[:page])
      #end
    else
      @member = Member.new
      @members = Member.page(params[:page]).order(updated_at: :desc)
    end
  end
  
  def new
    @member = Member.new
  end
  
  def create
    @member = Member.new(member_params)
    @member.name = @member.lastname.gsub(/(\s|　)+/, '')+@member.firstname.gsub(/(\s|　)+/, '')
    if @member.save
      redirect_to members_url
      #redirect_back(fallback_location: root_path)
    else
      render "new"
    end
  end
  
  def edit
    @member = Member.find(params[:id])
    
    @family = @member.families.build
    @remark = Remark.new
    @families = @member.families.rank(:row_order)
    @remarks = @member.remarks

    if params[:q]
      word = params[:q].gsub("　", "")
      @q = word.gsub(" ", "")
      @members = Member.where("lastname like '%"+ @q +"%'")
                 .or(Member.where("firstname like '%"+@q+"%'"))
                 .or(Member.where("namekana like '%"+@q+"%'"))
                 .or(Member.where("name like '%"+@q+"%'")) 
                 .page(params[:page])
    else
      @members = Member.where.not(:id => @member.id).page(params[:page])
    end
    @relationships = @member.member_relashionships.rank(:row_order)
  end
  
  def update
    @member = Member.find(params[:id])
    @member.name = params[:member][:lastname].gsub(/(\s|　)+/, '')+params[:member][:firstname].gsub(/(\s|　)+/, '')
    if @member.update(member_params)
      redirect_to edit_member_url(@member)
    else
      render "edit"
    end
  end
  
  def search
    @member = Member.find(params[:id])
    word = params[:q].gsub("　", "")
    w = word.gsub(" ", "")
    @members = Member.where("lastname like '%"+ w +"%'")
               .or(Member.where("firstname like '%"+w+"%'"))
               .or(Member.where("namekana like '%"+w+"%'"))
               .or(Member.where("name like '%"+w+"%'"))
  end
  
  def sort
    member = Member.find(params[:id])
    member.update!(member_params)
  end
  
  private

  def member_params
    params.require(:member).permit(:id,:lastname, :firstname, :namekana, :gender,
    :birthday, :postal, :city, :streetaddress, :tel, :mobile, :sect, :kind, :local,
    :reserve,:reserve2,:reserve3, :dm, :tag, :row_order_position)
  end
  
  def trim(object) #数字を半角に変換し、ハイフンを削除するロジック 
    if object
      object.delete!("-")
      object.delete!("－")
      object.delete!("ー")
      object.tr!('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
    end
  end



  
end
