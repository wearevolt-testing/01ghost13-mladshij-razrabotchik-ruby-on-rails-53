module SerializerHelper
  # Serializing object
  def serialize(object, context=nil)
    klass = convert_to_resource_class(object)
    JSONAPI::ResourceSerializer.new(klass).serialize_to_hash(klass.new(object, context))
  end
  private
    def convert_to_resource_class (object)
      Object.const_get("Api::V1::#{object.class.to_s}Resource")
    end
end