require 'rbovirt'
module OVIRT

  class Volume < BaseObject
    attr_reader :size, :disk_type, :bootable, :interface, :format, :sparse, :status, :storage_domain, :vm, :quota, :alias

    def initialize(client, xml)
      super(client, xml[:id], xml[:href], (xml/'name').first.text)
      parse_xml_attributes!(xml)
      self
    end

    def self.to_xml(opts={})
       builder = Nokogiri::XML::Builder.new do
        disk_{
          if opts[:storage_domain_id]
            storage_domains_{
              storage_domain_(:id => opts[:storage_domain_id])
            }
          end
          if opts[:size]
            size_(opts[:size])
          end
          if opts[:type]
            type_(opts[:type])
          end
          if opts[:bootable]
            bootable_(opts[:bootable])
          end
          if opts[:interface]
            interface_(opts[:interface])
          end
          if opts[:format]
            format_(opts[:format])
          end
          if opts[:sparse]
            sparse_(opts[:sparse])
          end
          if opts[:quota]
            quota_( :id => opts[:quota])
          end
          if opts[:alias]
            alias_(opts[:alias])
          end
        }
      end
      Nokogiri::XML(builder.to_xml).root.to_s
    end

    def parse_xml_attributes!(xml)
     @storage_domain = ((xml/'storage_domains/storage_domain').first[:id] rescue nil)
     @size = (xml/'size').first.text
     @disk_type = ((xml/'type').first.text rescue nil)
     @bootable = (xml/'bootable').first.text
     @interface = (xml/'interface').first.text
     @format = ((xml/'format').first.text rescue nil)
     @sparse = ((xml/'sparse').first.text rescue nil)
     @status = ((xml/'status/state').first.text rescue nil)
     @vm = Link::new(@client, (xml/'vm').first[:id], (xml/'vm').first[:href]) rescue nil
     @quota = ((xml/'quota').first[:id] rescue nil)
     @alias = ((xml/'alias').first.text rescue nil)
    end

  end
end
