json.benches do
    json.set! @bench.id do 
        json.extract! @bench, :title, :description, :price, :seating, :lat, :lng
    end
end