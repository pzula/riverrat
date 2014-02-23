class River

  attr_reader :id, :name, :state

  def initialize(params)
    @id = params["river_id"]
    @name = params["name"]
    @state = params["state"]
  end

end
