class TenantsController < ApplicationController
    
    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :created
    end

    def index
        render json: Tenant.all
    end

    def show
        tenant = find_tenant
        if tenant
            render json: tenant
        end
    end

    def update
        tenant = find_tenant
        if tenant
            tenant.update(tenant_params)
        end
        render json: tenant
    end

    def destroy
        tenant = find_tenant
        if tenant
            tenant.destroy
        end
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant
        Tenant.find(params[:id])
    end

end
