module YahooGeo
  class Error < RuntimeError; end
  class BadRequestError < Error; end
  class NotFoundError < Error; end
  class RequestTooLargeError < Error; end
  class UnsupportedMediaTypeError < Error; end
  class RateLimitError < Error; end
  class UnknownError < Error; end
end
