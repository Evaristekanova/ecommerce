module Paginable
    protected

    def get_links_serializer_params(links_path, collection)
        {
            links: {
                first: send(links_path, page: 1),
                last: send(links_path, page: collection.total_pages),
                prev: send(links_path, page: collection.prev_page),
                next: send(links_path, page: collection.next_page),
            }
        }
    end

    def current_page
       (params[:page] || 1).to_i
    end

    def per_page
        (params[:per_page] || 2).to_i
    end
end