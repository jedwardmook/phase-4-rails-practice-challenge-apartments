class LeasesController < ApplicationController

    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end

    def destroy
        lease = Lease.find(params:[:id])
        if lease
            lease.destory
        end
        head: :no_content
    end


    private
    def lease_params
        params.permit(:lease)
    end

end
