class ProductDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
        id: { source: "Product.id", cond: :eq },
        description: { source: "Product.description", cond: :like },
        #subgroup: { source: "Product.product_subgroup.description", cond: :eq },
        #cost_price: { source: "Product.cost_price", cond: :eq },
        #sale_price: { source: "Product.sale_price", cond: :eq },
        #created_at: { source: "Product.created_at", cond: :eq }
    }
  end

  def data
    records.map do |product|
      {
          # example:
          # id: record.id,
          # name: record.name
          id: product.id,
          description: product.description,
          subgroup: product.product_subgroup.try(:description),
          cost_price: product.cost_price,
          sale_price: product.sale_price,
          created_at: product.created_at,
          edit: "<a href='/products/#{product.id}/edit' data-remote='true'>Edit</a>",
          #delete: "<a href='/products/#{product.id}/delete' data-remote='true'>Delete</a>"
          delete: "<a href='/products/#{product.id}/delete' data-remote='true'>Delete</a>"

      }
    end
  end

  private

  def get_raw_records
    #Product.select 'id', 'description', 'cost_price', 'sale_price', 'created_at', 'subgroup.description'
    Product.all
  end



  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
