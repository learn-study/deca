class CreateBuddhistsermons < ActiveRecord::Migration[5.1]
  def change
    create_table :buddhistsermons do |t|
      t.integer :member_id
      t.string :applicantlastname
      t.string :applicantfirstname
      t.string :applicantkana
      #区分
      t.string :classification
      #担当者ID
      t.string :employee_id
      #法要ID
      t.integer :bdmemorial_id
      
      #受注日
      t.datetime :orderdate
      #亡くなった日
      t.string :deceased
      #市区町村
      t.string :city
      #番地
      t.string :streetaddress
      t.string :tel
      t.string :mobile
      #無くなった日
      t.datetime :ddate
      #戒名
      t.string :pardon
      #俗名
      t.string :popular
      #寺院
      t.string :temple_id
      #宗派
      t.string :sect_id
      #法要日
      t.datetime :bdmemorialdate
      #お参り時間
      t.datetime :visitingtime
      #会食時間
      t.datetime :diningtime
      #法要場所
      t.string :bdmemorialplace
      #法要市区町村
      t.string :bdmemorial_city
      #法要番地
      t.string :bdmemorial_address
      #法要電話番号
      t.string :bdmemorial_tel
      #ハガキ返信日時
      t.datetime :postcard
      #セット
      t.integer :set
      #セット枚数
      t.integer :setnumber
      #祭壇飾り
      t.integer :altar
      #祭壇飾り詳細
      t.string :altardetails
      #飲み物
      t.integer :drink
      #飲み物内容
      t.string :drinkdetails
      #会場費
      t.integer :dues
      #集金方法
      t.integer :collection_id
      #備考
      t.text :other
      t.integer :total_fee #合計金額
      t.integer :total_cost #原価

      t.timestamps
    end
  end
end
