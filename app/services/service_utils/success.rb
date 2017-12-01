module ServiceUtils
  class Success
    attr_reader :data

    def initialize(data = nil)
      @data = data
    end

    def success?
      true
    end

    def failure?
      false
    end
  end
end
