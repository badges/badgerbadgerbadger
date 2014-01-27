module Badger
  class Service < Hash
    def initialize hash
      self.update hash
    end
  end
end