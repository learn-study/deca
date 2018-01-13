class OrderPdf < Prawn::Document

  def initialize(member)
    super(page_size: 'A4')

    font "vendor/fonts/ipaexm.ttf"
    
    @member = member
    
    #各種会員情報
    @member.dm ? @dm = "する" : @dm = "しない"
    @member.gender=="女性" ? @gender ="女" : @gender="男"
    if @member.sect.present?
        @sect = Sect.find(@member.sect).sect
    end
    if @member.kind.present?
        @kind = Kind.find(@member.kind).text
    end    
    
    #備考

    
    
    # ヘッダー部分の表示
    header
    # ヘッダーリード部分の表示
    header_lead
    # テーブル部分の表示
    #table_content
    footer
  end
  def header
    text "会員カード", size: 16

    # stroke(線)の色を設定し、線を引く
    stroke_color "555555"
    stroke_line [0, 740], [530, 740]
  end
  
  def header_lead
    # カーソルを指定
    y_position = cursor - 30

    # bounding_boxで記載箇所を指定して、textメソッドでテキストを記載
    bounding_box([00, y_position], :width => 520, :height => 700) do

      font_size 10.5
      text "コード:  #{@member.id}　DM送付: #{@dm}"
      move_down 5
      text "氏名　:  #{@member.name}　　 カナ：　#{@member.namekana}　　 性別:　#{@gender}"
      move_down 5
      text "郵便番号　:  #{@member.postal}　　 "
      move_down 5
      text "住所１：　#{@member.city}"
      move_down 5
      text "住所２：　#{@member.streetaddress}"
      move_down 5
      text "TEL：　#{@member.tel}"
      move_down 5
      text "宗派：　#{@sect}　　　会種:　　#{@kind}"
      
      move_down 15
      text "家族情報", size: 16
      move_down 10

      @member.families.each do |fm|
        fm.dm ? dm = "する" : dm = "しない"
        text "氏名:　　#{fm.name}　続柄: 　#{fm.relationship}　DM: #{dm}"
        move_down 5
        text "備考:　　#{fm.note}"
        move_down 5
        text "郵便番号:　　#{fm.postal}"
        move_down 5
        text "住所１:　　#{fm.city}"
        move_down 5
        text "住所２:　　#{fm.streetaddress}"
        move_down 10
        text "…………………………………………………………………………………………………………………………………"
      end


      move_down 15
      text "備考", size: 16
      move_down 10
      
      @member.remarks.each do |rm|
        move_down 5
        text "#{rm.date}"
        move_down 5
        text "#{rm.content}"
        move_down 5
        text "…………………………………………………………………………………………………………………………………"
    end
  end
  
  def footer

    end
  end
end