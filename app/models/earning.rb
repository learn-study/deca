class Earning < ApplicationRecord
  include RankedModel
  ranks :row_order
end
