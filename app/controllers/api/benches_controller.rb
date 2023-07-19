class Api::BenchesController < ApplicationController
    def index
        @benches = Bench.all

        render :index
    end

    def show
        @bench = Bench.find_by(id: params[:id])

        if @bench 
            render :show
        else
            render [ errors: @bench.errors.full_messages, status: 422 ]
        end
    end

    def create
        @bench = Bench.new(bench_params)

        if @bench.save
            render :create
        else
            render [ errors: @bench.errors.full_messages, status: 422 ]
        end
    end

    def bench_params
        params.require(:bench).permit(:title, :description, :price, :seating, :lat, :lng )
    end
end
