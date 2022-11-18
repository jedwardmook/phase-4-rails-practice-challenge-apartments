class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end

    def show
        apartment = find_apartment
        if apartment
            render json: apartment
        end
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = find_apartment
        if apartment
            apartment.update(apartment_params)
        end
        render json: apartment
    end

    def destroy
        apartment = find_apartment
        if apartment
            apartment.destroy
        end
        head :no_content
    end

    private

    def find_apartment
        Apartment.find(params[:id])
    end

    def apartment_params
        params.permit(:number)
    end

end
