# Author::    Joseph Bauser (mailto:coderjoe@coderjoe.net)
# Copyright:: Copyright (c) 2010 Joseph Bauser
# License::   See LICENSE file
module YahooGeo
  # Error
  # The base error type
  class Error < RuntimeError; 
    attr_accessor :code, :message

    def initialize( code, message )
      @code = code
      @message = message
    end
  end

  # BadRequestError
  # HTTP 400 Bad Request
  class BadRequestError < Error; end

  # NotFoundError
  # HTTP 404 Not Found
  class NotFoundError < Error; end

  # RequestTooLargeError
  # HTTP 413 Request Too Large
  class RequestTooLargeError < Error; end

  # UnsupportedMediaTypeError
  # HTTP 415 Unsupported Media Type
  class UnsupportedMediaTypeError < Error; end

  # RateLimitError
  # HTTP 999 Yahoo! Geo API rate limit
  #
  # This can be caused by a number of different factors.
  # You may be making requests too frequently, or the API may be experiencing
  # a period of high load and be unable to service your request.
  #
  # Be a good developer, respect RateLimitError
  class RateLimitError < Error; end

  # UnknownError
  # Anything else
  class UnknownError < Error; end
end
