class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  private
  def trim(object) #数字を半角に変換し、ハイフンを削除するロジック 
      object.delete!("-")
      object.delete!("－")
      object.delete!("ー")
      object.tr!('０-９ａ-ｚＡ-Ｚ', '0-9a-zA-Z')
  end
end
