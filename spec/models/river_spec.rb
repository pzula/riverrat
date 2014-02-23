require 'spec_helper'

describe River do

  describe "creation" do
    describe "with valid params" do
      it "is created" do
        params = {
                  "river_id" =>  12,
                  "name" => "Black River",
                  "state" => "CO"
                  }
        response = River.new(params)
        expect(response.name).to eq("Black River")
        expect(response.id).to eq(12)
        expect(response.state).to eq("CO")
      end

    end
  end


end
