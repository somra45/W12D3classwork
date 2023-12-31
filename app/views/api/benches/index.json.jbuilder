json.benches do
    @benches.each do |bench|
        json.set! bench.id do 
            json.extract! bench, :title, :description, :price, :seating, :lat, :lng
        end
    end
end
