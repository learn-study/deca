class Cost < ApplicationRecord
  include RankedModel
  ranks :row_order
end
