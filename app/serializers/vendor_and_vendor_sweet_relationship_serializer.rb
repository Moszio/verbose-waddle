class VendorAndVendorSweetRelationshipSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :vendor_sweets
end
