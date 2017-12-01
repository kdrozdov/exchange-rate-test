module ServiceUtils
  class Error
    attr_reader :errors
    attr_reader :data
    attr_reader :error_type

    def initialize(errors, data: nil, error_type: nil)
      @errors = errors
      @data = data
      @error_type = error_type
    end

    def success?
      false
    end

    def failure?
      true
    end
  end
end
