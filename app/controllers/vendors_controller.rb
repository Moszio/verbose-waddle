class VendorsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found


    def index
        vendors = Vendor.all
        render json: vendors
    end

    def show 
        vendor = Vendor.find_by!(id: params[:id])
        render json: vendor, 
        serializer: VendorAndVendorSweetRelationshipSerializer
    end


    private

    def render_not_found
        render json: { error: "Vendor not found" }, status: :not_found
    end
end
