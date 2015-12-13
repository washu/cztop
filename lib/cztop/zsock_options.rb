module CZTop
  # This module adds the ability to access options of a {Socket} or an
  # {Actor}.
  # @see http://api.zeromq.org/czmq3-0:zsock-option
  module ZsockOptions
    # Access to the options of this socket.
    # @return [Options]
    def options
      OptionsAccessor.new(self)
    end

    # Used to access the options of a {Socket} or {Actor}.
    class OptionsAccessor
      # @return [Socket, Actor] whose options this {OptionsAccessor} instance
      #   is accessing
      attr_reader :zocket

      # @param zocket [Socket, Actor]
      def initialize(zocket)
        @zocket = zocket
      end

      # just to shorten the lines
      Z = ::CZMQ::FFI::Zsock

      # @return [Integer]
      def sndhwm() Z.sndhwm(@zocket) end
      # @param value [Integer]
      def sndhwm=(value) Z.set_sndhwm(@zocket, value) end
      # @return [Integer]
      def rcvhwm() Z.rcvhwm(@zocket) end
      # @param value [Integer]
      def rcvhwm=(value) Z.set_rcvhwm(@zocket, value) end
    end
  end
end
