module Fog
  module Compute
    class DigitalOcean
      class Real
        def detach_volume(volume_id, droplet_id, region)
          body = { :type => 'detach', droplet_id: droplet_id, region: region}

          encoded_body = Fog::JSON.encode(body)

          request(
            :expects => [201],
            :headers => {
              'Content-Type' => "application/json; charset=UTF-8",
            },
            :method  => 'POST',
            :path    => "v2/images/#{volume_id}/actions",
            :body    => encoded_body,
          )
        end
      end

      class Mock
        def detach_volume(volume_id, droplet_id, region)
          response         = Excon::Response.new
          response.status  = 201
					response.body    = {
						"action" => {
							"id" => 68212773,
							"status" => "in-progress",
							"type" => "detach_volume",
							"started_at" => "2015-10-15T17:46:15Z",
							"completed_at" => null,
							"resource_id" => null,
							"resource_type" => "backend",
							"region" => {
								"name" => "New York 1",
								"slug" => "nyc1",
								"sizes" => [
									"512mb",
									"1gb",
									"2gb",
									"4gb",
									"8gb",
									"16gb",
									"32gb",
									"48gb",
									"64gb"
								],
								"features" => [
									"private_networking",
									"backups",
									"ipv6",
									"metadata"
								],
								"available" => true
							},
							"region_slug" => "nyc1"
						}
					}

					response
				end
			end
		end
	end
end
