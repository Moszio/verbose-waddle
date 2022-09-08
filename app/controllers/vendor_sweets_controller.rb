class VendorSweetsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        vendorsweet = VendorSweet.create!(
            price: params[:price], 
            vendor_id: params[:vendor_id], 
            sweet_id: params[:sweet_id])
        render json: vendorsweet.sweet, status: :created
    end

    def destroy
        vendorsweet = VendorSweet.find_by!(id: params[:id])
        vendorsweet.destroy
        render json: {}
    end


    private

    def render_not_found
        render json: { error: "VendorSweet not found" }, status: :not_found
    end
    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
